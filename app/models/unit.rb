class Unit < ApplicationRecord
  has_many :players, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false, message: "already exists" }
end
