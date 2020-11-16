Rails.application.routes.draw do
  resources :articles
  

  get 'about', to: 'pages#about'


  root to: 'pages#index'
end
