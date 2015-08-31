Rails.application.routes.draw do
  resources :cities
  resources :countries
  root 'mainpages#index'

  devise_for :users
  resources :profiles, only: [:edit, :update, :show]
  resources :stores, :goods

  get '/', to: 'mainpages#index'
end
