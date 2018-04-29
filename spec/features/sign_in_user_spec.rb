# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'sign in user' do
  let(:user) { create(:user) }
  scenario 'with valid credentials' do
    visit '/'

    click_link('Login')

    expect(page).to have_content('Anmelden')
    fill_in('E-Mail', with: user.email)
    fill_in('Passwort', with: user.password)

    click_button('Anmelden')

    expect(page).to have_content("Hi, #{user.first_name}")
  end
end
