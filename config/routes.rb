Rails.application.routes.draw do
  devise_for :bloggers,  controllers: { sessions: 'bloggers/sessions', registrations: "bloggers/registrations" }
  #devise_for :bloggers, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  #get 'index', to: 'bloggers#index'
  #delete 'logout', to: 'bloggers/sessions#destroy'
  resources :bloggers
end
