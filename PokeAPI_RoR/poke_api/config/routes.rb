Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'public#index'

  resources :pokemons do
    member do
      get :delete
    end
  end
end
