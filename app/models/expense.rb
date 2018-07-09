class Expense < ApplicationRecord
  belongs_to :transport

  validates :date, :kind, :amount, presence: true
  validates :mileage, presence: true,
                      numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
