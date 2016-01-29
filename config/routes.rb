Rails.application.routes.draw do
  root to: 'posts#index'

  controller :sessions do
    get 'login' => :new
	  post 'login' => :create
	  delete 'logout' => :destroy
  end

  resources :authors do
    get "verify" => :verify_new
    post "verify" => :verify
  end
  
  resources :users do
    get "verify" => :verify_new
    post "verify" => :verify
  end

  resources :posts do
    resources :comments
  end

  resources :categories
end
