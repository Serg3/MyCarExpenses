require 'rails_helper'

feature 'Show all transports', %q{
  I want to be able to
  See all transports
} do

  scenario "All user's transports" do
    transports = create_list(:transport, 2)

    visit transports_path

    transports.each do |transport|
      expect(page).to have_content transport.name
    end
  end

end
