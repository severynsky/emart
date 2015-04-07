Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  devise_for :users
  get 'intro/hello'
  resources :products do
    resources :image
  end
  resources :categories
  resources :carts
  resources :product_records
  root 'intro#hello'

end
