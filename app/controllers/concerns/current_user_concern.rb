# frozen_string_literal: true

module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :current_user
  end

  def current_user
    super || guest_user
  end

  private

  def guest_user
    GuestUser.new(
      name: 'Guest User',
      email: 'example@example.com'
    )
  end
end
