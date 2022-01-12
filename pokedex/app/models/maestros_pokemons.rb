# frozen_string_literal: true

class MaestrosPokemons < ApplicationRecord
  belongs_to :maestro
  belongs_to :pokemon

  scope :sorted, -> { order('level DESC') }
end
