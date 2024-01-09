class GroupsController < ApplicationController

  def index
    @groups = Group.all
    date
  end
  def new
    @group = Group.new
  end
  def show
    @group = Group.find(params[:id])
  end
  def create
    puts "Current user ID: #{current_user.id}"
    @group = Group.new(group_params)
    @group.user = current_user
    puts "Group attributes: #{@group.attributes}"
    if @group.save
      redirect_to groups_url, notice: "Your restaurant has been added successfully"
    else
      render :new, alert: "Sorry!! some error occured"
    end
  end
  
  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def date
    @updated_time = Time.now
  end


end
