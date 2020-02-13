
Rails.application.routes.draw do
  root to: 'accueils#show'
  get '/team', to: 'teams#show'
  get '/contact', to: 'contacts#show'
  get'/welcome/:first_name', to: 'welcomes#show'
  resources :gossips
  resources :users
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
