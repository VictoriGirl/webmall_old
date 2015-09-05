module Sailer
  # ServicesController
  class ServicesController < ApplicationController
    before_action :authenticate_user!, :load_user, :load_store
    before_action :load_resource, only: [:show, :update, :edit, :destroy]

    def index
      @resource = @store.services.all
    end

    def new
      @resource = Service.new
    end

    def create
      @resource = Service.new(set_params.merge(store: @store))
      @resource.save ? (redirect_to action: 'show', store_title: @store.title, id: @resource.id) : (render :new)
    end

    def edit
    end

    def add
    end

    def update
      @resource.update(set_params) ? (redirect_to action: 'show', store_title: @store.title) : (render :edit)
    end

    def show
    end

    def destroy
      @resource.delete
      redirect_to store_services_path
    end

    private

    def adapt_keywords(string)
      string.split(',').map! {|k| k.strip } 
    end

    def load_user
      @user = current_user
    end

    def load_store
      @store = Store.find_by(title: params[:store_title])
    end

    def load_resource
      @resource = Service.find(params[:id])
    end

    def set_params
      p = params.require(:service).permit(:name, :category, :description, :price, :currency, :in_sight, :keywords)
      p[:keywords] = adapt_keywords(p[:keywords])
      p
    end
  end
end
