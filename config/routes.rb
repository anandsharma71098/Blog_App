Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  get 'signup', to: 'users#new'
  #post 'users', to: 'users#create'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'delete', to: 'sessions#destroy'
end
