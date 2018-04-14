# frozen_string_literal: true

module ApplicationHelper
  def login_helper(style)
    if current_user.instance_of?(User)
      logout_link(style)
    else
      "#{login_link(style)} #{register_link(style)}".html_safe
    end
  end

  # rubocop:disable GuardClause
  def source_helper(layout_name)
    if session[:source].present?
      content_tag(:p, class: 'source-greeting') do
        "Thanks for following me on #{session[:source]} and you are on the #{layout_name} layout"
      end
    end
  end

  # rubocop:enable GuardClause

  private

  def logout_link(style)
    link_to(
      'Logout',
      destroy_user_session_path,
      method: :delete,
      class: "#{style} #{current_page?(destroy_user_session_path) ? 'active' : ''}"
    )
  end

  def register_link(style)
    link_to(
      'Register',
      new_user_registration_path,
      class: "#{style} #{current_page?(new_user_registration_path) ? 'active' : ''}"
    )
  end

  def login_link(style)
    link_to(
      'Login',
      new_user_session_path,
      class: "#{style} #{current_page?(new_user_session_path) ? 'active' : ''}"
    )
  end
end
