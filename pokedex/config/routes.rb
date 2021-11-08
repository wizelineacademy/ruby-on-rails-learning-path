Rails.application.routes.draw do
  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'
  get 'pokemons/index'
  get 'pokemons/show'
  get 'pokemons/new'
  get 'pokemons/edit'
  get 'pokemons/delete'
  
  namespace :api do
    namespace :v1 do
      resources :pokemons do
        resources :abilities
      end
    end
  end
  
  resources :pokemons
end