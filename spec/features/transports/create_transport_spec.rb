require 'rails_helper'

feature 'Create transport', %q{
  I want to be able to
  Add a new transport
} do

  scenario 'User creates transport' do
    visit transports_path

    click_on 'Добавить транспорт'

    fill_in 'Имя', with: 'Снежок'
    fill_in 'Марка', with: 'Peugeot'
    fill_in 'Модель', with: '308'
    fill_in 'Год выпуска', with: '2012'

    click_on 'Создать'

    expect(page).to have_content 'Список транспорта'
    expect(page).to have_content 'Снежок'
    expect(page).to have_content 'Добавить транспорт'
  end

end
