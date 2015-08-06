Rails.application.routes.draw do

  root 'users#new'
  devise_for :users
end
