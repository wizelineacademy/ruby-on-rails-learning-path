Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#menu'

  get 'sessions/login'
  get 'sessions/logout'
  post 'sessions/attempt_login'
  resources :pokemons
  resources :users
  get 'pokemon_api_show', to: 'pokemons#pokemon_api_show'
  get 'api_info', to: 'pokemons#api_info'
end
