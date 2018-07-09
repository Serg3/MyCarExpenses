require 'rails_helper'

feature 'Show all expenses', %q{
  I want to be able to
  See all expenses
  Of my transport
} do

  scenario "All transport's expenses" do
    transport = create (:transport)
    expenses = create_list(:expense, 2, transport: transport)

    visit transport_path(transport)

    expenses.each do |expense|
      expect(page).to have_content expense.description
    end
  end

end
