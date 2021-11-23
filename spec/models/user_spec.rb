require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(
    first_name: 'Shamed',
    last_name: 'Calderon',
    email: 'acalderon@mail.com',
    username: 'acalderon',
    password: 'paswordtest'
  ) }

  it "is valid with valid arguments" do
    expect(subject).to be_valid
  end
  
  it "is not valid without full name" do
    subject.first_name = nil
    subject.last_name = nil

    expect(subject).not_to be_valid
  end

  it "is not valid without login credentials" do
    subject.email = nil
    subject.username = nil
    subject.password = nil

    expect(subject).not_to be_valid
  end

  it "has a no valid email" do
    subject.email = 'acalderon.mail.com'

    expect(subject).not_to be_valid
  end
end
