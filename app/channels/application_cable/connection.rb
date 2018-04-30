# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def guest_user
      guest = GuestUser.new do |g|
        g.name = 'Guest User'
        g.email = 'guest@user.com'
      end
      guest.id = guest.object_id
      guest
    end

    def connect
      self.current_user = find_verified_user || guest_user
      logger.add_tags('ActionCable', current_user.email)
      logger.add_tags('ActionCable', current_user.id)
    end

    protected

    def find_verified_user
      # rubocop:disable GuardClause, AssignmentInCondition
      if verified_user = env['warden'].user
        verified_user
      end
      # rubocop:enable GuardClause, AssignmentInCondition
    end
  end
end
