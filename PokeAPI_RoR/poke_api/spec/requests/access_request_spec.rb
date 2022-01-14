require 'rails_helper'

RSpec.describe 'users', type: :request do
  it 'logins an existing user' do
    post access_attempt_login_path(username: 'customuser', password: 'password')
    expect(response).to have_http_status(302)
    expect(response).to redirect_to pokemons_path
  end

  it 'does not login an unexisting user' do
    post access_attempt_login_path(username: 'invalid', password: 'invalid')
    expect(response).to have_http_status(200)
    expect(response.body).to include 'Invalid username/password combination.'
  end

  it 'logouts a user' do
    post access_attempt_login_path(username: 'customuser', password: 'password')
    get pokemons_path
    expect(response).to have_http_status(200)
    get access_logout_path
    expect(response).to have_http_status(302)
    get access_login_path
    expect(response.body).to include 'Logged out'
  end
end
