module Sailer
  # PopsController
  class PopsController < ApplicationController
    before_action :authenticate_user!, :load_user, :load_store
    before_action :load_resource, only: [:show, :update, :edit, :destroy]

    def new
      @resource = Pop.new
    end

    def create
      @resource = Pop.new(set_params.merge(store: @store))
      if @resource.save
        create_storage
        redirect_to new_store_pop_delivery_path(@store.title, @resource)
      else
        render :new
      end
    end

    def show
    end

    def edit
    end

    def update
      @resource.update(set_params) ? (render :show) : (render :edit)
    end

    def destroy
      @resource.delete
      redirect_to store_path(@store.title)
    end

    private

    def load_user
      @user = current_user
    end

    def load_store
      @store = @user.stores.find_by(title: params[:store_title])
    end

    def load_resource
      @resource = @store.pops.find(params[:id])
    end

    def set_params
      params.require(:pop).permit(:status, :name, :country, :city, :adress, :description, :working_from, :working_till, :cash, :card)
    end

    def create_storage
      wares = @store.wares
      wares.each { |w| WareStorage.create(ware: w, pop: @resource, in_sight: false, store: @store) } if wares.any?
    end
  end
end
