# frozen_string_literal: true

class Skill < ApplicationRecord
  validates :title, :percent_utilized, presence: true
end
