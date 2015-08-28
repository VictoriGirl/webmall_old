# StoresController
class StoresController < ApplicationController
  before_action :authenticate_user!, :load_user
  before_action :load_resource, only: [:show, :update, :edit, :destroy]

  def new
    @resource = Store.new
  end

  def create
    @resource = Store.create(set_params.merge(user: @user, date_of_opening: Time.zone.now))
    @resource.present? ? redirect_to(@resource) : (render :new)
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def load_user
    @user = current_user
  end

  def load_resource
    @resource = @user.stores.find(params[:id])
  end

  def set_params
    params.require(:store).permit(:name, :type, :store_country, :store_city)
  end
end
