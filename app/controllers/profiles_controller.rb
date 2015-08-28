# ProfilesController
class ProfilesController < ApplicationController
  before_action :authenticate_user!, :load_user
  before_action :load_resource, only: [:show, :update, :edit]

  def edit
  end

  def update
    @resource.update(set_params) ? (redirect_to @resource) : (render new_profile_path)
  end

  def show
    render :edit if @resource.first_name.blank?
  end

  private

  def load_user
    @user = current_user
  end

  def load_resource
    @resource = @user.profile
  end

  def set_params
    p = params.require(:profile).permit(:first_name, :last_name, :date_of_birth)
    p[:date_of_birth] = Time.zone.parse(p[:date_of_birth])
    p
  end
end
