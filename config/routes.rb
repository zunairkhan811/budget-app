Rails.application.routes.draw do
  get 'foods/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users
  # resources :groups
  # resources :foods

  resources :groups do
    resources :foods
  end
  root "groups#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
