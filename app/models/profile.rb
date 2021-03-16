class Profile < ApplicationRecord
  belongs_to :user

  validates :firstname, presence: true, length: {minimum: 2}
  validates :lastname, presence: true, length: {minimum: 2}
  
  
end
