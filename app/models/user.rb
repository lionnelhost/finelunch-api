# frozen_string_literal: true

class User < ActiveRecord::Base
  enum roles: {
    admin: 'ADMIN',
    manager: 'MANAGER',
    customer: 'CUSTOMER'
  }


  extend Devise::Models #added this line to extend devise model

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User


  #associations 
  has_one :profile, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  #validations 
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  
end
