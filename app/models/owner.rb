class Owner < ApplicationRecord
    has_many :adoptions
    has_many :breeds, through: :adoptions
  
    validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phone_number, presence: true
    validates :address, presence: true
  end
  