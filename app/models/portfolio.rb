# frozen_string_literal: true

class Portfolio < ApplicationRecord
  validates :title, :subtitle, :body, :main_image, :thumb_image, presence: true
end
