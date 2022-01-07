require 'rails_helper'

RSpec.describe User, type: :model do
  context "user data" do
    it "must contain user_name, email and password" do
      expect { User.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
