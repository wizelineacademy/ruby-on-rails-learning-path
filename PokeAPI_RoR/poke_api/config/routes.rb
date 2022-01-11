Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'pokemons#index'

  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'
  get 'pokemons/set_pokemons' => 'pokemons#set_pokemons', as: :set_pokemons

  resources :users do
    member do
      get :delete
    end
  end

  resources :pokemons do
    member do
      get :delete
    end
  end
end
