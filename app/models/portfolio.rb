# frozen_string_literal: true

class Portfolio < ApplicationRecord
  has_many :technologies
  include Placeholder
  validates :title, :subtitle, :body, :main_image, :thumb_image, presence: true
  scope :angular, -> { where(subtitle: 'Angular') }
  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: 300, width: 150)
    self.thumb_image ||= Placeholder.image_generator(height: 120, width: 60)
  end
end
