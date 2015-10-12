# ProfilesController
class ProfilesController < ApplicationController
  before_action :authenticate_user!, :load_user
  before_action :load_resource, only: [:show, :update, :edit]
  before_action :first_show, only: [:show]
  before_action :set_layout, only: [:show, :edit]

  def edit
  end

  def update
    @resource.update(set_params) ? (redirect_to @resource) : (render template: "profiles/#{@user.role}_edit")
  end

  def show
  end

  private

  def set_layout
    @user = @user
    @resource = @resource
    render template: "profiles/#{@user.role}_#{action_name}"
  end

  def first_show
    render template: "profiles/#{@user.role}_edit" if @resource.first_name.blank?
  end

  def load_user
    @user = current_user
  end

  def load_resource
    @resource = @user.profile
  end

  def set_params
    p = params.require(:profile).permit(:first_name, :last_name, :date_of_birth, :company, :phone_number, :country, :city, :adress)
    p[:date_of_birth] = Time.zone.parse(p[:date_of_birth])
    p
  end
end
