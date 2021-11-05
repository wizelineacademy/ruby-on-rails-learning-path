Rails.application.routes.draw do
  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  get 'access/attempt_login'
  get 'access/logout'
  get 'pokemons/index'
  get 'pokemons/show'
  get 'pokemons/new'
  get 'pokemons/edit'
  get 'pokemons/delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
