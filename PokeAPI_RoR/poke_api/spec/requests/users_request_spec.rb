require 'rails_helper'

RSpec.describe 'users', type: :request do
  # Create post request to login
  before :all do
    post access_attempt_login_path(username: 'customuser', password: 'password')
  end

  let(:user) { User.first }

  it 'shows a user' do
    get user_path(user)
    expect(response).to have_http_status(200)
    expect(response.body).to include 'customuser'
  end

  it 'shows all users' do
    expect { get users_path }.to raise_error(ActionController::RoutingError)
  end

  it 'edit a user' do
    get edit_user_path(user)
    expect(response).to have_http_status(200)
  end

  it 'delete a user' do
    get delete_user_path(user)
    expect(response).to have_http_status(200)
  end

  it 'create a user' do
    get new_user_path
    expect(response).to have_http_status(200)
  end
end
