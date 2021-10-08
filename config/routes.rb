Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create]
  
  root to: 'articles#index'
  resources :articles
end
