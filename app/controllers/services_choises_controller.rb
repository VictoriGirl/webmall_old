# ServicesChoisesController
class ServicesChoisesController < ApplicationController
  before_action :load_user
  before_action :load_resource, only: [:show]

  def index
    @resource = Service.all
  end

  def show
  end

  def search
    @resource = Service.all.order_by(count_buying: 'desc').full_text_search(params[:search], allow_empty_search: true)
  end

  private

  def load_user
    @user = user_signed_in? ? current_user : nil
  end

  def load_resource
    @resource = Service.find(params[:id])
  end
end
