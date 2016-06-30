Rails.application.routes.draw do
  resources :groups
  devise_for :users, controllers: {registrations: 'users/registrations'}

  resources :users, only: [:index]

  get '/user', to: 'users#index', as: 'user'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
