class User < ApplicationRecord

    has_secure_password
    
    has_many :pokemon_cards
    belongs_to :user_type

    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

    validates :first_name, :presence => true,
                           :length => { :maximum => 50 }

    validates :last_name,  :presence => true,
                           :length => { :maximum => 50 }

    validates :username,   :presence => true,
                           :length => { :within => 8..15 },
                           :uniqueness => true

    validates :email,      :presence => true,
                           :length => { :maximum => 100 },
                           :format => EMAIL_REGEX,
                           :confirmation => true

    scope :sorted, lambda { order("last_name ASC, first_name ASC") }

    def name
        "#{first_name} #{last_name}"
    end
end
