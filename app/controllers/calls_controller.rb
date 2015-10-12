# CallsController
class CallsController < ApplicationController
  before_action :authenticate_user!, :load_user
  before_action :load_resource, only: [:show, :update, :destroy]

  def index
    @resource = @user.present? ? (@user.try { calls.where(status: 'new') }) : nil
    @resource = @resource.paginate(page: params[:page], per_page: 30)
    count_full_price if @resource.present?
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

  def destroy
    @resource.delete
    redirect_to calls_path
  end

  private

  def load_user
    @user = current_user
  end

  def count_full_price
    @full_price = { 'RUB' => 0, 'USD' => 0, 'EUR' => 0 }
    @resource.each do |w|
      @full_price[w.ware.currency] = @full_price[w.ware.currency] + w.count * w.ware.price
    end
    @full_price.delete_if { |_k, v| v == 0 }
  end

  def load_resource
    @resource = Call.find(params[:id])
  end
end
