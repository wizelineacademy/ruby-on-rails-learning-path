Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#menu'

  get 'sessions/login'
  get 'sessions/logout'
  post 'sessions/attempt_login'
  resources :pokemons
  resources :users
  get 'pokemon_api_show', to: 'pokemons#pokemon_api_show'
  post 'api_info', to: 'pokemons#api_info'
  post 'save_pokemon_from_api', to: 'pokemons#save_pokemon_from_api'
end
