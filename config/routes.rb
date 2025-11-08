Rails.application.routes.draw do
  root "characters#index"

  resources :characters, only: [ :index, :show ]
  resources :episodes, only: [ :index, :show ]
  resources :quotes, only: [ :index ]
  resources :locations, only: [ :index, :show ]

  get "about", to: "pages#about"
end
