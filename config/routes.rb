Rails.application.routes.draw do
  resources :cities
  resources :countries
  root 'mainpages#index'

  devise_for :users
  resources :profiles, only: [:edit, :update, :show]
  resources :stores, except: [:index] do
    resources :goods
    get 'goods/:id/add', to: 'goods#add'
  end

  get '/', to: 'mainpages#index'
end
