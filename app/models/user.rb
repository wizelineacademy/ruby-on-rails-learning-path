class User < ApplicationRecord
  has_secure_password

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates :first_name, :presence => true,
                          :length => { :maximum => 25 }
  validates :last_name, :presence => true,
                        :length => { :maximum => 50 }
  validates :email, :presence => true,
                    :length => { :maximum => 200 },
                    :format => EMAIL_REGEX,
                    :confirmation => true

  def name
    "#{first_name} #{last_name}"
  end
end
