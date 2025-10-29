Rails.application.routes.draw do
  # CRUD completo para los modelos clave
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users, path: "admin/users"
  resources :badges
  resources :challenges
  resources :challenge_participations
  resources :progress_entries
  resources :user_badges


  get "up" => "rails/health#show", as: :rails_health_check


  root "challenges#index" 
end
