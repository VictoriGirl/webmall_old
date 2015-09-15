module Sailer
  # WareStoragesController
  class WareStoragesController < ApplicationController
    before_action :authenticate_user!, :load_user, :load_store
    before_action :load_resource, only: [:edit, :update]

    def index
      if params[:pop_id].present?
        @pop = @store.pops.find(params[:pop_id])
        @resource = WareStorage.where(pop: @pop)
      elsif params[:ware_id].present?
        @ware = @store.wares.find(params[:ware_id])
        @resource = WareStorage.where(ware: @ware)
      end
      @resource = @resource.paginate(page: params[:page], per_page: 30)
    end

    def edit
      if params[:pop_id].present?
        @pop = @store.pops.find(params[:pop_id])
      elsif params[:ware_id].present?
        @ware = @store.wares.find(params[:ware_id])
      end
    end

    def update
    end

    private

    def load_user
      @user = current_user
    end

    def load_store
      @store = @user.stores.find_by(title: params[:store_title])
    end

    def load_resource
      @resource = WareStorage.find(params[:id])
    end
  end
end
