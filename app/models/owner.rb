class Owner < ApplicationRecord
    has_many :adoptions
    has_many :breeds, through: :adoptions
  
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  end
  