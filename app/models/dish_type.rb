class DishType < ApplicationRecord

    has_many :dishes, dependent: :destroy
    
    validates :name, presence: true, length: {maximum: 50, minimum: 2 }
    validates :name, presence: true
end
