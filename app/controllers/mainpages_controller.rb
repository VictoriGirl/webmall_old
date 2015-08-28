# MainpagesController
class MainpagesController < ApplicationController
  def index
    @user = current_user.present? ? current_user : nil
  end
end
