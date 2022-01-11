class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :pokemons
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i.freeze

  validates :username, length: { within: 8..25 },
                       uniqueness: true
  validates :email, presence: true,
                    length: { maximum: 100 },
                    format: EMAIL_REGEX,
                    confirmation: true
end
