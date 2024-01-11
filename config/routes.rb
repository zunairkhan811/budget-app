Rails.application.routes.draw do
  get 'splash/index'
  get 'foods/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users
  resources :splash

  resources :groups do
    resources :foods
  end
  root "splash#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
