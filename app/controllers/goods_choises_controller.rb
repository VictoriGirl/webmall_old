# GoodsChoisesController
require 'will_paginate/array'

class GoodsChoisesController < ApplicationController
  before_action :load_user
  before_action :load_resource, only: [:show]

  def index
    @resource = Ware.where(ware_type: 'goods').select {|w| w.ware_storages.gte(count: 0).length > 0 }
    @resource = @resource.paginate(page: params[:page], per_page: 30)
  end

  def show
    @call = Call.where(ware: @resource, user: @user, status: 'new').first || Call.new
  end

  def search
    @resource = Ware.where(ware_type: 'goods').desc(:buying_count).full_text_search(params[:search], allow_empty_search: true)
    @resource = @resource.paginate(page: params[:page], per_page: 30)
  end

  private

  def load_user
    @user = user_signed_in? ? current_user : nil
  end

  def load_resource
    @resource = Ware.find(params[:id])
  end
end
