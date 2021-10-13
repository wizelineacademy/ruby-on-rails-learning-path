class Pokemon < ApplicationRecord
  has_many :abilities
  has_many :moves

  validates :name, presence: true
end
