Rails.application.routes.draw do
  resources :authors
  resources :users
  resources :posts do
    resources :comments
  end
  resources :categories
end
