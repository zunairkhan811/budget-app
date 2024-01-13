class SplashController < ApplicationController
  before_action :redirect_to_dashboard, if: :user_signed_in?, only: :index

  def index; end

  private

  def redirect_to_dashboard
    redirect_to groups_path
  end
end
