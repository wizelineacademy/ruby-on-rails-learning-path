Rails.application.routes.draw do
  root to: "dashboard#main"
  get 'dashboard/main'
  get 'dashboard/pokemons'
  get 'dashboard/items', to: "dashboard#pokeItems"
  post 'dashboard/capturePokemon', to: "dashboard#capture"
  get 'dashboard/newPokeball', to: "dashboard#giveRandomPokeballToUser"
  get 'login', to: "login#auth", as: :LoginPage
  post 'login', to: "login#login"
  get 'login/auth'
  get 'login/register'
  post 'login/register', to: "login#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
