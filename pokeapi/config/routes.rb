Rails.application.routes.draw do
  get 'abilities/index'
  get 'abilities/show'
  get 'abilities/new'
  get 'abilities/edit'
  get 'abilities/delete'
  get 'stats/index'
  get 'stats/show'
  get 'stats/new'
  get 'stats/edit'
  get 'stats/delete'

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
