Rails.application.routes.draw do
  get 'intro/hello'
  resources :products
  resources :categories
  root 'intro#hello'

end
