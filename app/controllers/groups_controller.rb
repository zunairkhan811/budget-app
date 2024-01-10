class GroupsController < ApplicationController
  before_action :set_group, only: [:show]
  def index
    @groups = Group.all
    date
    # sum_of_amount_for_group
  end
  def new
    @group = Group.new
  end
  def show
    @group = Group.find(params[:id])
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
      render :new, alert: "Sorry!! some error occured"
    end
  end
  
  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def sum_of_amount_for_group
    @sum_of_amount = @group.foods.sum(:amount)
  end

  def date
    @updated_time = Time.now
  end


end
