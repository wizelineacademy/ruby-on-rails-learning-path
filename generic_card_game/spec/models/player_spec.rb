require 'rails_helper'

RSpec.describe Player, :type => :model do
    let(:name) { "Player" }

    def subject
      Player.new(email: 'test@somewhere.com', password: 'secret')
    end

    context  'Validate model attributes' do

      it 'Should not be valid without arguments' do
        player = Player.new
        expect(player).not_to be_valid
      end

      it "is not valid without a password" do
        player_test = Player.new(email: 'test@somewhere.com')
        expect(player_test).not_to be_valid
      end

      it "should be valid with email and password" do
        expect(subject).to be_valid
      end

      it "has encrypted password" do
        expect(subject.password_digest).to be_truthy
      end

      it 'fails to authenticate with wrong password' do
        expect(subject.authenticate('not_the_password')).to be_falsey
      end

      it "successfully authenticates with correct password" do
        expect(subject.authenticate('secret')).to be_truthy
      end

    end
end