require 'rails_helper'

feature 'Create expense', %q{
  I want to be able to
  Add a new expense
} do

  scenario 'User creates expense' do
    transport = create (:transport)
    visit transport_path(transport)

    click_on 'Внести трату'

    fill_in 'Дата', with: '2018-07-09'
    fill_in 'Пробег', with: 111555
    fill_in 'Вид траты', with: 'Заправка'
    fill_in 'Описание', with: 'Бензин'
    fill_in 'Сумма', with: 29.99

    click_on 'Записать'

    expect(page).to have_content '2018-07-09'
    expect(page).to have_content 111555
    expect(page).to have_content 'Бензин'
    expect(page).to have_content 29.99
  end

end
