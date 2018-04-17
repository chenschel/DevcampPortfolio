# frozen_string_literal: true

module ApplicationHelper
  def login_helper(style = '')
    links = login_links(style)

    links.map! { |link| yield link } if block_given?

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

  def nav_item_helper(style)
    links = [
      nav_link('Home', root_path, style),
      nav_link('About me', about_me_path, style),
      nav_link('Contact', contact_path, style),
      nav_link('Blog', blogs_path, style),
      nav_link('Portfolio', portfolios_path, style)
    ]

    links.map! { |link| yield link } if block_given?

    links.join.html_safe
  end

  private

  def login_links(style)
    links = []

    if current_user.instance_of?(User)
      links << nav_link('Logout', destroy_user_session_path, style, method: :delete)
    else
      links << nav_link('Login', new_user_session_path, style)
      links << nav_link('Register', new_user_registration_path, style)
    end
    links
  end

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

  def nav_link(text, path, style, method: :get)
    link_to(text, path, class: "#{style} #{active?(path)}", method: method)
  end

  def active?(path)
    'active' if current_page?(path)
  end
end
