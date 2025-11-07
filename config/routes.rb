Rails.application.routes.draw do
get "/about", to: "pages#about"

  # Root route
  root "characters#index"

  # Resources
  resources :characters, only: [ :index, :show ]
  resources :episodes, only: [ :index, :show ]
  resources :locations, only: [ :index, :show ]

  # Health check for uptime monitors
  get "up" => "rails/health#show", as: :rails_health_check
end
