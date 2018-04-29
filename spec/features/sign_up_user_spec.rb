# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'sign up user' do
  context 'user does not exists' do
    let(:user) { build(:user) }

    scenario 'with valid data' do
      visit '/'

      click_link('Register')

      expect(page).to have_content('Registrieren')

      fill_in('E-Mail', with: user.email)
      fill_in('Passwort', with: user.password)
      fill_in('Passwortbestätigung', with: user.password)
      fill_in('Name', with: user.name)

      click_button('Registrieren')

      expect(page).to have_content("Hi, #{user.first_name}")
    end
  end

  context 'user does exists' do
    let(:user) { create(:user) }

    scenario 'with valid data' do
      visit '/'

      click_link('Register')

      expect(page).to have_content('Registrieren')

      fill_in('E-Mail', with: user.email)
      fill_in('Passwort', with: user.password)
      fill_in('Passwortbestätigung', with: user.password)
      fill_in('Name', with: user.name)

      click_button('Registrieren')

      expect(page).to have_content('E-Mail ist bereits vergeben')
    end
  end
end
