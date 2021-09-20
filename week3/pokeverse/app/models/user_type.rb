class UserType < ApplicationRecord

    has_many :users

    USER_TYPES = ["normal", "admin"]

    validates_presence_of :user_type

    validates_inclusion_of :user_type, :in => USER_TYPES, 
        :message => "must be one of: #{USER_TYPES.join(', ')}"

    scope :normal, lambda { find(1) }
    scope :admin, lambda { find(2) }
end
