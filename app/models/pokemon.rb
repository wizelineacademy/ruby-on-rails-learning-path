class Pokemon < ApplicationRecord
  has_many :abilities
  has_many :moves
end
