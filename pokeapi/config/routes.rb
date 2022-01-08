Rails.application.routes.draw do

  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :pokemons do
    member do
      get :delete
    end
  end

  resources :abilities do
    member do
      get :delete
    end
  end

  resources :stats do
    member do
      get :delete
    end
  end


  get 'pokemon/index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
