# GoodsController
class GoodsController < ApplicationController
  before_action :authenticate_user!, :load_user, :load_store
  before_action :load_resource, only: [:show, :update, :edit, :destroy, :add]

  def index
    @resource = @store.goods.all
  end

  def new
    @resource = Good.new
  end

  def create
    @resource = Good.new(set_params.merge(store: @store, in_sight: true))
    @resource.save ? (redirect_to action: 'show', store_title: @store.title, id: @resource.id) : (render :new)
  end

  def edit
  end

  def add
  end

  def update
    @resource.update(set_params) ? (redirect_to action: 'show', store_title: @store.title) : (render :new)
  end

  def show
  end

  def destroy
    @resource.delete
    redirect_to store_goods_path
  end

  private

  def load_user
    @user = current_user
  end

  def load_store
    @store = Store.find_by(title: params[:store_title])
  end

  def load_resource
    @resource = Good.find(params[:id])
  end

  def set_params
    p = params.require(:good).permit(:name, :category, :description, :count, :unit)
    p[:count] = @resource.try(:count).to_i + p[:count].to_i
    p
  end
end
