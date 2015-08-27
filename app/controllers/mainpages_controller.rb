# MainpagesController
class MainpagesController < ApplicationController
  def index
    @user = current_user.present? ? @user : false
  end
end
