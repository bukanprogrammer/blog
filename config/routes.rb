Rails.application.routes.draw do

  root 'home#index'

  resources :articles, only: [:index]
  resources :categories, only: [:index]
  resources :errors, only: [:index]

end
