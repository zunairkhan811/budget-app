Rails.application.routes.draw do
  get 'splash/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :groups do
    resources :foods, only: %i[new create]
  end
  root "splash#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
