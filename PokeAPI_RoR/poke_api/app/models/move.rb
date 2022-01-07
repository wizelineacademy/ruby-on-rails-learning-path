class Move < ApplicationRecord
  # acts_as_list scope: :pokemon
  belongs_to :pokemon, optional: false
end
