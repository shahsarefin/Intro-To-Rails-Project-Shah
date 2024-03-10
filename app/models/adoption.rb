class Adoption < ApplicationRecord
    belongs_to :breed
    belongs_to :owner

    validates :breed_id, presence: true
    validates :owner_id, presence: true
    validates :adoption_date, presence: true
  end
  