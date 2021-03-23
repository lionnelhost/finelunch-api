class Menu < ApplicationRecord
    has_many :menu_items, dependent: :destroy
    validates :date, presence: true
end
