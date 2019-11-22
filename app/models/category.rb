class Category < ApplicationRecord
  has_many :events

  validates :nombre, presence: true
end
