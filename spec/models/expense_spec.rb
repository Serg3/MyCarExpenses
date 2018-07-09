require 'rails_helper'

RSpec.describe Expense, type: :model do
  it { should belong_to :transport }

  it { should validate_presence_of :date }
  it { is_expected.to validate_presence_of(:mileage) }
  it { is_expected.to validate_numericality_of(:mileage)
                      .is_greater_than_or_equal_to(0).only_integer }
  it { should validate_presence_of :kind }
  it { should validate_presence_of :amount }
end
