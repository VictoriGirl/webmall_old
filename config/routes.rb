Rails.application.routes.draw do
  root 'mainpages#index'

  devise_for :users
  resources :profiles, only: [:edit, :update, :show]
  
  get '/mainpages/', to: 'mainpages#index'
end
