require 'rails_helper'

RSpec.describe PokeItem, type: :model do
  context "poke item required fields" do
    it "must have all fields but image_route" do
      item = PokeItem.new
      item.image_route = "URL"
      expect{item.save}.to raise_error(ActiveRecord::NotNullViolation)
    end
  end
end
