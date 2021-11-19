# frozen_string_literal: true

class AbilitiesPokemon < ApplicationRecord
  belongs_to :ability
  belongs_to :pokemon
end
