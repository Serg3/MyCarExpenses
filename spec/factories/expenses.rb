FactoryBot.define do
  sequence :description do |n|
    "TestDescription#{n}"
  end

  factory :expense do
    date Time.now
    mileage 123456
    kind 'TestKind'
    description
    amount 49.99
  end

  factory :invalid_expense, class: 'Expense' do
    date nil
    mileage nil
    kind nil
    description nil
    amount nil
  end
end
