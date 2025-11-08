Rails.application.routes.draw do
  # Root route
  root "characters#index"

  # Core resources
  resources :characters, only: [:index, :show]
  resources :episodes, only: [:index, :show]
  resources :locations, only: [:index, :show]
  resources :quotes, only: [:index]  # ← add this for your quotes page

  # Static pages
  get "about", to: "pages#about"

  # Health check for uptime monitors
  get "up" => "rails/health#show", as: :rails_health_check
end
