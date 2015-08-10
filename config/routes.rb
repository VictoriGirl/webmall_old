Rails.application.routes.draw do
  root 'profiles#show'

  devise_for :users
  resource :profiles
end
