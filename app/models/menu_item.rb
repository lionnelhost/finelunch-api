class MenuItem < ApplicationRecord
  belongs_to :dish
  belongs_to :menu
end
