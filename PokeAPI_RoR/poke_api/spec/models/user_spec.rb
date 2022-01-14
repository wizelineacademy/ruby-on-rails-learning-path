require 'rails_helper'

RSpec.describe 'user', type: :model do
  let(:user) { User.new(username: 'testinguser', email: 'email@email.com', password: 'secret') }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid with short username' do
    user.username = 'test'
    expect(user).to_not be_valid
  end

  it 'is not valid with long username' do
    user.username = ['a'..'z'].to_a.join
    expect(user).to_not be_valid
  end

  it 'is not valid with wrong email format' do
    user.email = 'test'
    expect(user).to_not be_valid
  end
end
