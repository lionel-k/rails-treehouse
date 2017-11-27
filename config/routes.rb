Rails.application.routes.draw do
  devise_for :users
  resources :treehouses, only: [:index, :show, :create, :new]
  resources :journeys, only: [:index, :create]
  root to: 'pages#home'
end
