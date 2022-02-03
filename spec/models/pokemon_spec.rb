require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  subject { described_class.new(
    name: 'Pikachu',
    height: 4,
    weight: 60,
    hp: 35,
    attack: 55,
    defense: 40,
    special_attack: 50,
    special_defense: 50,
    speed: 90,
  ) }

  it "is valid with valid arguments" do
    expect(subject).to be_valid
  end
  
  it "is not valid without name" do
    subject.name = nil

    expect(subject).not_to be_valid
  end

  it "is not valid without measures" do
    subject.height = nil
    subject.weight = nil

    expect(subject).not_to be_valid
  end

  it "is no valid without stats" do
    subject.hp = nil
    subject.attack = nil
    subject.defense = nil
    subject.special_attack = nil
    subject.special_defense = nil
    subject.speed = nil

    expect(subject).not_to be_valid
  end
end
