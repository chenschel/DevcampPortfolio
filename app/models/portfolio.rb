# frozen_string_literal: true

class Portfolio < ApplicationRecord
  validates :title, :subtitle, :body, :main_image, :thumb_image, presence: true
  scope :angular, -> { where(subtitle: 'Angular') }
  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= 'http://via.placeholder.com/300x150'
    self.thumb_image ||= 'http://via.placeholder.com/120x60'
  end
end
