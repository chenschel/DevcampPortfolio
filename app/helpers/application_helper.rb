# frozen_string_literal: true

module ApplicationHelper
  def login_helper(style = '')
    links = []

    if current_user.instance_of?(User)
      links << logout_link(style)
    else
      links << login_link(style)
      links << register_link(style)
    end

    yield links if block_given?

    links.join.html_safe
  end

  # rubocop:disable GuardClause
  def source_helper
    if session[:source].present?
      content_tag(:p, class: 'source-greeting') do
        "Thanks for following me on #{session[:source]}"
      end
    end
  end

  # rubocop:enable GuardClause

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(markdown_options)
    markdown = Redcarpet::Markdown.new(renderer, markdown_extensions)

    markdown.render(text).html_safe
  end

  private

  def markdown_extensions
    {
      autolink: true,
      superscript: true,
      disable_indented_code_blocks: true
    }
  end

  def markdown_options
    {
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: 'nofollow', target: '_blank' },
      space_after_headers: true,
      fenced_code_blocks: true
    }
  end

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
