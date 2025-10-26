Rails.application.routes.draw do
  resources :users, only: [:index, :show]
  resources :progress_entries, only: [:index, :show]
  resources :challenge_participations, only: [:index, :show]
  resources :badges, only: [:index, :show]
  resources :challenges, only: [:index, :show]

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Root path
  root "users#index"
end
