# ServicesChoisesController
class ServicesChoisesController < ApplicationController
  before_action :load_user
  before_action :load_resource, only: [:show]

  def index
  end

  def show
  end

  private

  def load_user
    @user = user_signed_in? ? current_user : nil
  end

  def load_resource
    @resource = Service.find(params[:id])
  end
end
