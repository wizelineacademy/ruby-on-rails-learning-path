Rails.application.routes.draw do
  root to: "dashboard#main"
  get 'dashboard/main'
  get 'login', to: "login#auth", as: :LoginPage
  post 'login', to: "login#login"
  get 'login/auth'
  get 'login/register'
  post 'login/register', to: "login#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
