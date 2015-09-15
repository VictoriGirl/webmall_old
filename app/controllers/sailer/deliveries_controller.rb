module Sailer
  # DeliveriesController
  class DeliveriesController < ApplicationController
    before_action :authenticate_user!, :load_user, :load_store, :load_pop
    before_action :load_resource, only: [:update, :edit, :destroy]

    def new
      @resource = Delivery.new
    end

    def create
      @resource = Delivery.create(set_params.merge(pop: @pop))
      @resource.save ? (redirect_to store_pop_path(@store.title, @pop.id)) : (render :new)
    end

    def edit
    end

    def update
      @resource.update(set_params) ? (redirect_to store_pop_path(@store.title, @pop.id)) : (render :edit)
    end

    def destroy
      @resource.delete
      redirect_to store_pop_path(@store.title, @pop.id)
    end

    private

    def load_user
      @user = current_user
    end

    def load_store
      @store = @user.stores.find_by(title: params[:store_title])
    end

    def load_pop
      @pop = @store.pops.find(params[:pop_id])
    end

    def load_resource
      @resource = @pop.deliveries.find(params[:id])
    end

    def set_params
      params.require(:delivery).permit(:type, :description)
    end
  end
end
