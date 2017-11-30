Rails.application.routes.draw do
  devise_for :users
  resources :treehouses, only: [ :index, :show, :create, :new ] do
    resources :journeys, only: :create
  end
  resources :journeys, only: :index do
    member do
      get "validate", to: "journeys#validate"
    end
  end
  root to: 'pages#home'

  # patch "journeys/:id", to: "journeys#validate"
end
