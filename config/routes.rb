Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'

  get 'home', to: "pages#home"

  get 'about', to: "pages#about"

  get 'privacy_policy', to: "pages#privacy_policy"

  get 'terms', to: "pages#terms"

  get 'search/articles', to: "articles#search"

  resources :categories

  resources :articles

  resources :subscribers, only: [:create]

  namespace :admin do
    resources :articles
  end

end
