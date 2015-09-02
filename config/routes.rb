Rails.application.routes.draw do
  resources :cities
  resources :countries
  root 'mainpages#index'

  devise_for :users
  resources :profiles, only: [:edit, :update, :show]

  resources :stores, param: :title, except: [:index] do
    resources :goods do
      get 'add', on: :member
    end
    resources :services
  end
  resources :calls

  get '/', to: 'mainpages#index'
end
