class DishType < ApplicationRecord
    validates :label, presence: true, length: {maximum: 50, minimum: 2 }
    validates :label, presence: true
end
