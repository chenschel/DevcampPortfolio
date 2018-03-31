# frozen_string_literal: true

class Portfolio < ApplicationRecord
  validates :title, :subtitle, :body, :main_image, :thumb_image, presence: true
  scope :angular, -> { where(subtitle: 'Angular') }
  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }
end
