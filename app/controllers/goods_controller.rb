# GoodsController
class GoodsController < ApplicationController
  before_action :authenticate_user!, :load_user
  before_action :load_resource, only: [:show, :update, :edit, :destroy]

  def new
    @resource = Good.new
  end

  def create
    @resource = Good.create(set_params.merge(user: @user))
    @resource.valid? ? redirect_to(@resource) : (render :new)
  end

  def edit
  end

  def update
    @resource.update(set_params) ? (redirect_to @resource) : (render new_store_path)
  end

  def show
  end

  def destroy
    store = @resource.store
    @resource.delete
    redirect_to store_path(store)
  end

  private

  def load_user
    @user = current_user
  end

  def load_resource
    @resource = @user.profile
  end

  def set_params
    params.require(:good).permit(:name, :category, :description, :in_sight)
  end
end
