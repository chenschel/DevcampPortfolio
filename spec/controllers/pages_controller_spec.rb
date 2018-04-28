# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET home' do
    it 'renders the home template' do
      get :home
      expect(response.status).to eq(200)
      expect(response).to render_template('home')
    end
  end

  describe 'GET about' do
    it 'renders the about me template' do
      get :about
      expect(response.status).to eq(200)
      expect(response).to render_template('about')
    end
  end

  describe 'GET contact' do
    it 'renders the contact template' do
      get :contact
      expect(response.status).to eq(200)
      expect(response).to render_template('contact')
    end
  end

  describe 'GET social media' do
    it 'renders the about me template' do
      get :social_media
      expect(response.status).to eq(200)
      expect(response).to render_template('social_media')
    end
  end
end
