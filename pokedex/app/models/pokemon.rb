# frozen_string_literal: true

class Pokemon < ApplicationRecord
  has_many :abilities_pokemons
  has_many :games_pokemons
  has_and_belongs_to_many :moves
  has_many :pokemons_stats
  has_and_belongs_to_many :types
  has_one :form
  has_many :sprites
  has_and_belongs_to_many :maestros

  validates :name, :pokedex_id, :location_area_encounters, :order, :weight, :height, presence: true
  validates :height, :pokedex_id, :order, :weight, numericality: { only_integer: true }
  validates :name, :pokedex_id, uniqueness: true
  validates :name, length: { maximum: 40 }
end
