Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pokemons#index'

  resources :pokemons
   get '/profile/:id', to: 'pokemons#profile' 


end
