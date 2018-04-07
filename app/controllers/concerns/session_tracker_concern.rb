# frozen_string_literal: true

module SessionTrackerConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_source
  end

  def set_source
    session[:source] = params[:q] if params[:q].presence
  end
end
