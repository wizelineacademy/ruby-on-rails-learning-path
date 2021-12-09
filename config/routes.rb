Rails.application.routes.draw do
  get 'auth/login'
  post 'auth/attempt_login'
  get 'auth/logout'
  get 'pokemons/index'
  get 'pokemons/show'
  get 'pokemons/edit'
  get 'pokemons/delete'
  root :to => 'pokemons#index'

  resources :pokemons do
    member do
      get :delete
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
