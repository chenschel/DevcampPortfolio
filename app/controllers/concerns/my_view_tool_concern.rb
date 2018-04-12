# frozen_string_literal: true

module MyViewToolConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_copyright
  end

  def set_copyright
    @copyright = MyViewTool::Renderer.copyright('Itza me Marioo', 'All rights reserved')
  end
end
