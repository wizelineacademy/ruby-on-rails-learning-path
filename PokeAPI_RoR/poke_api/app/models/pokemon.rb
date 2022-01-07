class Pokemon < ApplicationRecord
  # acts_as_list
  has_many :abilities
  has_many :moves
  has_many :types

  validates :name, presence: true, length: { maximum: 25 }
  validates :pokedex_id, presence: true
end
