Rails.application.routes.draw do
  get 'product_records/create'

  get 'product_records/destroy'

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  devise_for :users, :controllers => { registrations: 'registrations' }
  
  get 'intro/hello'
  resources :products do
    resources :image
  end
  resources :categories
  resources :users_profile
  resources :carts
  resources :product_records
  root 'intro#hello'

end
