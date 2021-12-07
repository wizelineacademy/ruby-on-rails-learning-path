class Pokemon < ApplicationRecord
    has_and_belongs_to_many :trainers
    validates :name, uniqueness: true
end
