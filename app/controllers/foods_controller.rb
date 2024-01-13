class FoodsController < ApplicationController
  before_action :authenticate_user!

  def new
    puts "Group ID from params: #{params[:group_id]}"
    @group = Group.find(params[:group_id])
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.author = current_user
    if @food.save
      redirect_to group_path(params[:group_id]), notice: 'Food was successfully added.'
    else
      puts @food.errors.full_messages
      render :new, notice: 'There is some error'
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :amount, :group_id)
  end
end
