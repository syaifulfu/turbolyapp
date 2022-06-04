Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'homes#index'
  	
	get 'users/new' => 'users#new', as: :new_user
	post 'users' => 'users#create'
	get '/login'     => 'sessions#new'
	post '/login'    => 'sessions#create'
	delete '/logout' => 'sessions#destroy' 
  
  # HOME
  get '/index' => 'homes#index'

  # TASK
  resources :tasks

  # TODAY
  get '/todays' => 'todays#index', as: :todays

end
