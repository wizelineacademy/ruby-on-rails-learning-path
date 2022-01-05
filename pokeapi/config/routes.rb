Rails.application.routes.draw do
  get 'pokemons/index'
  get 'pokemons/show'
  get 'pokemons/new'
  get 'pokemons/edit'
  get 'pokemons/delete'

  get 'pokemon/index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
