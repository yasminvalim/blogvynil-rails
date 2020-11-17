Rails.application.routes.draw do
  resources :articles
  resources :users, except: [:new]


  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  root to: 'pages#index'
end
