Rails.application.routes.draw do
  resources :users, only: [:show, :index, :create, :edit, :update, :destroy]
  get 'signup', to: 'users#new'
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
end
