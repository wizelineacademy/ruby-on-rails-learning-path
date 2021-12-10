# frozen_string_literal: true

FactoryBot.define do
  factory :trainer do
    id { 4 }
    email { 'test@pokemon.com' }
    password { '12345678' }
  end
end
