Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'sessions/login'
  post 'sessions/attempt_login'
  resources :pokemons
end
