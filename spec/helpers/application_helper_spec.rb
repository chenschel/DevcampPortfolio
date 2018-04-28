# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#nav_links' do
    let(:style) { 'css_style_class' }
    let(:nav_links) do
      [
        helper.send(:nav_link, 'Home', root_path, style),
        helper.send(:nav_link, 'About me', about_me_path, style),
        helper.send(:nav_link, 'Contact', contact_path, style),
        helper.send(:nav_link, 'Tech-News', social_media_path, style),
        helper.send(:nav_link, 'Blog', blogs_path, style),
        helper.send(:nav_link, 'Portfolio', portfolios_path, style)
      ]
    end

    it 'return an Array of links' do
      expect(helper.send(:nav_links, style)).to be_an_instance_of(Array)
    end

    it 'return the expected amount of nav items' do
      expect(helper.send(:nav_links, style).size).to eq(nav_links.size)
    end
  end
end
