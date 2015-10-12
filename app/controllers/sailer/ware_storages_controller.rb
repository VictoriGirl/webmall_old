module Sailer
  # WareStoragesController
  class WareStoragesController < ApplicationController
    before_action :authenticate_user!, :load_user, :load_store
    before_action :load_resource, only: [:update]

    def index
      if params[:pop_id].present?
        @pop = @store.pops.find(params[:pop_id])
        @resource = WareStorage.where(pop: @pop).desc(:created_at)
      elsif params[:ware_id].present?
        @ware = @store.wares.find(params[:ware_id])
        @resource = WareStorage.where(ware: @ware).desc(:created_at)
      end
      @resource = @resource.paginate(page: params[:page], per_page: 30)
    end

    def update
      @resource.update(set_params)
      set_redirect
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

    def set_params
      params.require(:ware_storage).permit(:price, :count, :in_sight)
    end

    def set_redirect
      redirect_to store_ware_storages_path(@store.title, pop_id: params[:ware_storage][:pop_id]) if params[:ware_storage][:pop_id].present?
      redirect_to store_ware_storages_path(@store.title, ware_id: params[:ware_storage][:ware_id]) if params[:ware_storage][:ware_id].present?
    end
  end
end
