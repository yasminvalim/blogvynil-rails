Rails.application.routes.draw do
  get 'about', to: 'pages#about'


  root to: 'pages#index'
end
