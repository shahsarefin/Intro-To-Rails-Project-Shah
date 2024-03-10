class Owner < ApplicationRecord
    has_many :adoptions
    has_many :breeds, through: :adoptions
  end
  