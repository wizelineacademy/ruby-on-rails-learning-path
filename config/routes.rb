Rails.application.routes.draw do
  resources :my_pokemons
  devise_for :trainers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pokemons#index'
  resources :pokemons
  resources :my_pokemons  
  resources :trainers
  get "*path" => redirect("/")
end
