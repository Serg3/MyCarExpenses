require 'rails_helper'

RSpec.describe Transport, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :mark }
  it { should validate_presence_of :model }
  it { should validate_presence_of :edition_year }
end
