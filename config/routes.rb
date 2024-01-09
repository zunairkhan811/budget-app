Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users
  resources :groups
  root "groups#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
