Rails.application.routes.draw do
  root to: "dashboard#main"
  get 'dashboard/main'
  get 'login', to: "login#auth", as: :LoginPage
  get 'login/auth'
  get 'login/register'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
