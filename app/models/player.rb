class Player < ApplicationRecord
  belongs_to :unit
  validates :steam_id, uniqueness: {
    scope: :unit_id,
    message: "already exists in this unit"
  }
end
