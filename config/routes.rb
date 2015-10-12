Rails.application.routes.draw do
  # resources :cities
  # resources :countries
  root 'mainpages#index'

  get '/', to: 'mainpages#index'

  devise_for :users
  resources :profiles, only: [:edit, :update, :show]

  resources :goods_choises, only: [:index, :show] do
    get 'search', on: :collection
  end
  resources :services_choises, only: [:index, :show] do
    get 'search', on: :collection
  end
  resources :stores_choises, param: :title, only: [:index, :show] do
    get 'search', on: :collection
  end

  resources :calls

  scope module: 'sailer' do
    resources :stores, param: :title, except: [:index] do
      resources :pops, except: [:index] do
        resources :deliveries, except: [:show]
      end
      resources :goods
      resources :services
      resources :ware_storages, only: [:index, :update]
    end
  end
end
