class Unit < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false, message: "already exists" }
end
