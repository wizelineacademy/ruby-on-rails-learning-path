class Pokemon < ApplicationRecord
  # acts_as_list
  has_many :abilities
  has_many :moves
  has_many :types
  has_and_belongs_to_many :users

  scope :sorted, -> { order(:name) }

  validates :name, presence: true, length: { maximum: 25 }
  validates :pokedex_id, presence: true
end
