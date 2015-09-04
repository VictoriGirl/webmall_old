Rails.application.routes.draw do
  # resources :cities
  # resources :countries
  root 'mainpages#index'

  get '/', to: 'mainpages#index'

  devise_for :users
  resources :profiles, only: [:edit, :update, :show]
  resources :goods_choises do
    get 'search', on: :collection
  end
  resources :services_choises
  resources :calls

  scope module: 'sailer' do
    resources :stores, param: :title, except: [:index] do
      resources :goods do
        get 'add', on: :member
      end
      resources :services
    end
  end
end
