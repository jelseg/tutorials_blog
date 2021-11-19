Rails.application.routes.draw do
  resources :users, only: [:show, :index, :create, :edit, :update, :destroy]
  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :articles
  root 'pages#home'
  get 'about', to: 'pages#about'
end
