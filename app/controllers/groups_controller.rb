class GroupsController < ApplicationController
  before_action :find_group, only: [:show,:edit,:update, :destroy]
  def index
    @groups = Group.all
    date
  end
  def new
    @group = Group.new
  end
  def show
    @foods = @group.foods
    date
    sum_of_amount_for_group
  end
  def create
    puts "Current user ID: #{current_user.id}"
    @group = Group.new(group_params)
    @group.user = current_user
    puts "Group attributes: #{@group.attributes}"
    if @group.save
      redirect_to groups_url, notice: "Your restaurant has been added successfully"
    else
      redirect_to request.referer, alert: "Sorry!! some error occured"
    end
  end

  def destroy
    # authorize! :destroy, @group
    if @group.destroy
      redirect_to groups_path, notice: 'Restaurant deleted'
    else
      puts @group.errors.full_messages
      redirect_to request.referer, notice: 'Restaurant could not be deleted'
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_path, notice: 'Restaurant updated'
    else
      render :edit, alert: 'Could not update Restaurant'
    end
  end
  
  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def find_group
    @group = Group.find(params[:id])
  end

  def sum_of_amount_for_group
    @sum_of_amount = @group.foods.sum(:amount)
  end

  def date
    @updated_time = Time.now
  end


end
