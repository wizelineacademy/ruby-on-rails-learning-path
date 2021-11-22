Rails.application.routes.draw do
  root :to => 'pokemon#index'

  get 'pokemon/search'

  resources :pokemon do
    member do
      get :delete
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
