class Transport < ApplicationRecord
  validates :name, :mark, :model, :edition_year, presence: true
end
