# ProfilesController
class ProfilesController < ApplicationController
  before_action :authenticate_user!, :load_user
  before_action :load_resource, only: :show

  def new
  end

  def create
    @resource = Profile.create(set_params.merge(user: @user))
    @resource.present? ? (redirect_to @resource) : (render :new)
  end

  def show
    render :new if @resource.blank?
  end

  private

  def load_user
    @user = current_user
  end

  def load_resource
    @resource = params[:id]
  end

  def set_params
    params.require(:profile).permit(:first_name, :last_name, :date_of_birth)
  end
end
