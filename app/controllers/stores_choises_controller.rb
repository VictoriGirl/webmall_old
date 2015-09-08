# StoresChoisesController
class StoresChoisesController < ApplicationController
  before_action :load_user
  before_action :load_resource, only: [:show]

  def index
    @resource = Store.all
    @resource = @resource.paginate(page: params[:page], per_page: 30)
  end

  def show
  end

  def search
    @resource = Store.all.desc(:buying_count).full_text_search(params[:search], allow_empty_search: true)
    @resource = @resource.paginate(page: params[:page], per_page: 30)
  end

  private

  def load_user
    @user = user_signed_in? ? current_user : nil
  end

  def load_resource
    @resource = Store.find_by(title: params[:title])
  end
end
