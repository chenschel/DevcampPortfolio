# frozen_string_literal: true

module DefaultPageContentConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = 'Devcamp Portfolio | My Portfolia Website'
    @seo_keywords = 'Chs Portfolio'
  end
end
