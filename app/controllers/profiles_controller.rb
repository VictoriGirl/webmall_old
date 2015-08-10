# ProfilesController
class ProfilesController < ApplicationController
  before_action :load_resource, only: :show

  def new
    @resource = Profile.new
  end

  def create
    @resource = Profile.create(set_params)
    render @resource
  end

  def show
    render :new if @resource.blank?
  end

  private

  def load_resource
    @resource = current_user.profile
  end

  def set_params
    params.require(:profile).permit(:first_name, :last_name, :date_of_birth)
  end
end
