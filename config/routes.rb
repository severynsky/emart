Rails.application.routes.draw do
  get 'intro/hello'
  resources :products
  root 'intro#hello'

end
