# frozen_string_literal: true

class Portfolio < ApplicationRecord
  has_many :technologies, inverse_of: :portfolio
  accepts_nested_attributes_for :technologies,
                                allow_destroy: true,
                                reject_if: ->(attrs) { attrs[:name].blank? }

  validates :title, :subtitle, :body, presence: true

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  scope :angular, -> { where(subtitle: 'Angular') }
  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }
  scope :by_position, -> { order(position: :asc) }
end
