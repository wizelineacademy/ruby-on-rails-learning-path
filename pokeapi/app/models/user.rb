class User < ApplicationRecord

  has_secure_password
  has_many :pokemons, class_name: "pokemon"


  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates_presence_of :name
  validates_length_of :name, :maximum => 50
  validates_presence_of :username
  validates_length_of :username, :within => 1..25
  validates_uniqueness_of :username
  validates_presence_of :email
  validates_length_of :email, :maximum => 100
  validates_format_of :email, :with => EMAIL_REGEX
  validates_confirmation_of :email

end
