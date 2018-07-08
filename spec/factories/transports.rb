FactoryBot.define do
  sequence :name do |n|
    "TestTransport#{n}"
  end

  factory :transport do
    name
    mark 'TestMark'
    model 'TestModel'
    edition_year 2000
  end

  factory :invalid_transport, class: 'Transport' do
    name nil
    mark nil
    model nil
    edition_year nil
  end
end
