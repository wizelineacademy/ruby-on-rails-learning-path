Rails.application.routes.draw do
  
  get 'admin', :to => 'access#menu'
  get 'user', :to => 'access#user_menu'
  get 'access/menu'
  get 'access/user_menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  post 'pokemons/load_new_pokemon'

  resources :pokemon_cards do
    member do
      get :delete
    end
  end

  resources :users, :except => [:show] do
    member do
      get :delete
    end
  end

  resources :pokemons, :except => [:edit, :update, :new, :create]

  resources :pokeverse_api, :except => [:edit, :update, :new, :create]

end