# frozen_string_literal: true

Rails.application.routes.draw do
  get 'admin', to: 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'
  get 'pokemons/index'
  get 'pokemons/show'
  get 'pokemons/edit'
  get 'maestros_pokemons/new'
  get 'maestros_pokemons/delete'

  namespace :api do
    namespace :v1 do
      resources :pokemons do
        resources :abilities
      end
    end
  end

  resources :pokemons

  resources :maestros_pokemons
end
