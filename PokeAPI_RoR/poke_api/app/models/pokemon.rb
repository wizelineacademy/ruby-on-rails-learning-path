class Pokemon < ApplicationRecord
  has_many :abilities
  has_many :moves
  has_many :types
  has_and_belongs_to_many :users

  accepts_nested_attributes_for :abilities, :moves, :types

  scope :sorted, -> { order(:name) }

  validates :name, presence: true, length: { maximum: 25 }
  validates :base_experience, presence: true
  validates :height, presence: true
  validates :weight, presence: true
  validates :pokedex_id, presence: true
  validates :abilities, presence: true
  validates :moves, presence: true
  validates :types, presence: true
end
