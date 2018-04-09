# frozen_string_literal: true

module ApplicationHelper
  def login_helper
    if current_user.is_a?(User)
      link_to('Logout', destroy_user_session_path, method: :delete)
    else
      login = link_to('Login', new_user_session_path)
      register = link_to('Register', new_user_registration_path)
      "#{login} #{register}".html_safe
    end
  end
end
