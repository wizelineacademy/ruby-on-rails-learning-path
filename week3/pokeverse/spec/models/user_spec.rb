require 'rails_helper'

RSpec.describe User, type: :model do
    
    it { should have_many(:pokemon_cards) }
    it { should belong_to(:user_type) }
    it { should validate_presence_of(:first_name) }
    it { should validate_length_of(:first_name).is_at_most(50) }
    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:last_name).is_at_most(50) }
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:username).is_at_least(8).is_at_most(15) }
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_most(100) }
    
end