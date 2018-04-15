# frozen_string_literal: true

class Topic < ApplicationRecord
  validates :title, presence: true
  has_many :blogs

  scope :by_title, -> { all.order(:title) }
end
