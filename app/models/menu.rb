class Menu < ApplicationRecord
    has_many :menu_items
    validates :date, presence: true
end
