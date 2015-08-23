Rails.application.routes.draw do
  root 'mainpages#index'

  devise_for :users
  get '/mainpages/', to: 'mainpages#index'
  resources :profiles, except: :index
end
