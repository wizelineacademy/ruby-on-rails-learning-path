# frozen_string_literal: true

class Type < ApplicationRecord
  has_and_belongs_to_many :pokemons
end
