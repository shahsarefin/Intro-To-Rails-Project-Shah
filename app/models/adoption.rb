class Adoption < ApplicationRecord
    belongs_to :breed
    belongs_to :owner
  end
  