class Player < ApplicationRecord
    has_secure_password
    has_one :pokemon_trainer

    def as_json(options={})
        options[:except] ||= :password_digest
        super
    end
end
