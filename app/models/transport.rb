class Transport < ApplicationRecord
  has_many :expenses
  
  validates :name, :mark, :model, :edition_year, presence: true
end
