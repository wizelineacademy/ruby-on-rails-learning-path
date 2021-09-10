Rails.application.routes.draw do
  get 'messages/create'
  namespace :api do
    namespace :v1 do
      post 'players/create'
      get '/players/:id', to: 'players#show'
      get 'players/destroy'

      post '/rooms/create', to: 'rooms#create'
      post 'rooms/leave', to: 'rooms#leave'
      get '/room/:uuid', to: 'rooms#join'
      delete '/destroy/:uuid', to: 'rooms#destroy'

      get 'pokemon/catch'
      get 'pokemon/collection'

      get 'access/logged_in', to: 'access#is_logged_in?'
      post 'access/authenticate'
      post 'access/logout'
    end
  end
 
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
  
  resources :rooms, param: :slug
  resources :messages

  root 'homepage#index'

  get '/*path' => 'homepage#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
