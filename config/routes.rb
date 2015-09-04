Rails.application.routes.draw do
  # resources :cities
  # resources :countries
  root 'mainpages#index'

  get '/', to: 'mainpages#index'

  devise_for :users
  resources :profiles, only: [:edit, :update, :show]

  scope module: 'sailer' do
    resources :stores, param: :title, except: [:index] do
      resources :goods do
        get 'add', on: :member
      end
      resources :services
    end
  end

  scope module: 'client' do
    resources :calls
    resources :goods_choises
    resources :services_choises
  end
end
