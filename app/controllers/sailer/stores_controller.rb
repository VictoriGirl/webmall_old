module Sailer
  # StoresController
  class StoresController < ApplicationController
    before_action :authenticate_user!, :load_user
    before_action :load_resource, only: [:show, :update, :edit, :destroy]

    def new
      @resource = Store.new
    end

    def create
      @resource = Store.new(set_params.merge(user: @user, date_of_opening: Time.zone.now))
      @resource.save ? (redirect_to action: 'show', title: @resource.title) : (render :new)
    end

    def edit
    end

    def update
      @resource.update(set_params) ? (redirect_to action: 'show', title: @resource.title) : (render :edit)
    end

    def show
    end

    def destroy
      @resource.delete
      redirect_to profile_path(@user.profile)
    end

    private

    def load_user
      @user = current_user
    end

    def load_resource
      @resource = @user.stores.find_by(title: params[:title])
    end

    def set_params
      params.require(:store).permit(:name, :speciality, :ware_type, :store_country, :store_city, :title)
    end
  end
end
