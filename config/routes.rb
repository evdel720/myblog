Rails.application.routes.draw do
  root to: 'posts#index'
  
  controller :sessions do
    get 'login' => :new
	post 'login' => :create
	delete 'logout' => :destroy
  end
  
  resources :authors
  resources :users
  
  resources :posts do
    resources :comments
  end
  
  resources :categories  
end
