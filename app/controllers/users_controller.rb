# UsersController
class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @resource = User.create(resource_params)
  end

  def update
    @resource.update(resource_params)
  end

  def delete
    @resource.destroy
  end

  private

  def resource_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
