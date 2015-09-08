# CallsController
class CallsController < ApplicationController
  before_action :authenticate_user!, :load_user
  before_action :load_resource, only: [:show, :update]

  def index
    @resource = @user.present? ? (@user.try { calls.where(status: 'new') }) : nil
    @resource = @resource.paginate(page: params[:page], per_page: 30)
  end

  def create
    @ware = Ware.find(params['call']['ware'])
    @resource = Call.create(ware: @ware, user: @user, status: 'new', buying_price: @ware.price, buying_currency: @ware.currency, count: params['call']['count'], call_date: Time.zone.now)
    redirect_to :back
  end

  def update
    @resource.update(count: @resource.count.to_i + params['call']['count'].to_i)
    redirect_to :back
  end

  private

  def load_user
    @user = current_user
  end

  def load_resource
    @resource = Call.find(params[:id])
  end
end
