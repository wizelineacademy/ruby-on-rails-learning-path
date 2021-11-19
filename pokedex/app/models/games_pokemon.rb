# frozen_string_literal: true

class GamesPokemon < ApplicationRecord
  belongs_to :pokemon
  belongs_to :game
end
