class Pokemon < ApplicationRecord

    validates :name, uniqueness: true

    

end
