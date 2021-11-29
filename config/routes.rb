Rails.application.routes.draw do
  root :to => 'pokemon#index'

  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :pokemons, controller: 'pokemon' do
    member do
      get :delete
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
