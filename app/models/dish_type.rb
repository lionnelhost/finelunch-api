class DishType < ApplicationRecord

    has_many :dishes, class_name: "dish", foreign_key: "dish_id"
    
    validates :label, presence: true, length: {maximum: 50, minimum: 2 }
    validates :label, presence: true
end
