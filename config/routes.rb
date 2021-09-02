Rails.application.routes.draw do
  devise_for :bloggers,  controllers: { sessions: 'bloggers/sessions', registrations: "bloggers/registrations" }
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  #get 'index', to: 'bloggers#index'
  resources :bloggers
  resources :categories, except: [:destroy] 
end
