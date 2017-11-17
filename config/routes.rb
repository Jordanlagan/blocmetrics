Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end

  resources :registered_applications

  devise_for :users
  root to: 'home#index'

end
