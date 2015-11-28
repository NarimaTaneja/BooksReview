Rails.application.routes.draw do
  get 'users/new'
  root 'books#index'
  resources :books do
  	resources :reviews 
  end
  get '/signup' => 'users#new'
  resources :users 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get '/users' => 'books#index'
end
