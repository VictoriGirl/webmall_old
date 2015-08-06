class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @user = User.create(set_params)
  end

  private

  def resource_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end