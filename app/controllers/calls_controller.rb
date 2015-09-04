# CallsController
class CallsController < ApplicationController
  before_action :load_user
  before_action :load_resource, only: [:show, :new, :create]

  def index
    @resource = Call.all
  end

  def show
  end

  private

  def load_user
    @user = user_signed_in? ? current_user : nil
  end

  def load_resource
    @resource = Good.find(params[:id])
  end
end
