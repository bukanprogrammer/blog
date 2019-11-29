Rails.application.routes.draw do
  root 'home#index'

  resources :categories

  resources :articles

  get :about, to: 'about#index'

  get :terms, to: 'terms#index'
  
  get :privacy_policy, to: 'privacy_policy#index'

end
