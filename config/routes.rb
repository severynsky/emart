Rails.application.routes.draw do
  devise_for :users
  get 'intro/hello'
  resources :products
  resources :categories
  root 'intro#hello'

end
