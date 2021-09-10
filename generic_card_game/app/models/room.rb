class Room < ApplicationRecord
    include ActiveModel::Serializers::JSON
    has_many :players
    has_many :messages
    has_one :game
end
