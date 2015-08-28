# GoodsController
class GoodsController < ApplicationController
  before_action :authenticate_user!, :load_user
  before_action :load_resource, only: [:show, :update, :edit, :destroy]

  def new
  end

  def create
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
    @resource = @user.profile
  end

  def set_params
    params.require(:good).permit(:name, :category, :description, :in_sight)
  end
end
