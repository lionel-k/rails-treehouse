Rails.application.routes.draw do
  devise_for :users
  resources :treehouses, only: [ :index, :show, :create, :new ] do
    resources :journeys, only: :create
  end
  resources :journeys, only: :index
  root to: 'pages#home'
end
