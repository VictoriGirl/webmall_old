module Sailer
  # GoodsController
  class GoodsController < ApplicationController
    before_action :authenticate_user!, :load_user, :load_store
    before_action :load_resource, only: [:show, :update, :edit, :destroy]

    def index
      @resource = @store.goods
      @resource = @resource.paginate(page: params[:page], per_page: 30)
    end

    def new
      @resource = Ware.new
    end

    def create
      @resource = Ware.new(set_params.merge(store: @store, ware_type: @store.ware_type))
      if @resource.save
        create_storage
        redirect_to action: 'show', store_title: @store.title, id: @resource.id
      else
        render :new
      end
    end

    def edit
    end

    def update
      @resource.update(set_params) ? (redirect_to action: 'show', store_title: @store.title) : (render :edit)
    end

    def show
    end

    def destroy
      @resource.delete
      redirect_to store_goods_path
    end

    private

    def adapt_keywords(string)
      string.split(',').map!(&:strip)
    end

    def load_user
      @user = current_user
    end

    def load_store
      @store = @user.stores.find_by(title: params[:store_title])
    end

    def load_resource
      @resource = Ware.find(params[:id])
    end

    def set_params
      p = params.require(:ware).permit(:name, :category, :description, :keywords, :currency, :unit)
      p[:keywords] = adapt_keywords(p[:keywords]) if p[:keywords].present?
      p
    end

    def create_storage
      pops = @store.pops
      pops.each { |p| WareStorage.create(pop: p, ware: @resource, in_sight: false, store: @store) } if pops.any?
    end
  end
end
