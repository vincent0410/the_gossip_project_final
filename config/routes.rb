
Rails.application.routes.draw do

  get '/team', to: 'teams#show'
  get '/contact', to: 'contacts#show'
  get'/welcome/:first_name', to: 'welcomes#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
