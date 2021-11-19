# frozen_string_literal: true

class Maestro < ApplicationRecord
  has_secure_password
  has_many :maestros_pokemons
  has_many :pokemons, through: :maestros_pokemons
end
