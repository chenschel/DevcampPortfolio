# frozen_string_literal: true

module ApplicationHelper
  def alerts
    alert_generator(*flash_message_and_type)
  end

  def alert_generator(message, title, image)
    js(add_gritter(message, title: title, image: image))
  end

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

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end

  def markdown(text)
    coderayifyed = CodeRayify.new(markdown_options)
    markdown = Redcarpet::Markdown.new(coderayifyed, markdown_extensions)
    markdown.render(text).html_safe
  end

  def nav_item_helper(style)
    links = nav_links(style)

    links.map! { |link| yield link } if block_given?

    links.join.html_safe
  end

  private

  def flash_message_and_type
    return [flash[:alert], 'Alert', :alert] if flash[:alert]
    return [flash[:error], 'Error', :error] if flash[:error]
    [flash[:notice], 'Info', :success]
  end

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
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      lax_html_blocks: true
    }
  end

  def markdown_options
    {
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: 'nofollow', target: '_blank' },
      space_after_headers: true
    }
  end

  def nav_links(style)
    [
      nav_link('Home', root_path, style),
      nav_link('About me', about_me_path, style),
      nav_link('Contact', contact_path, style),
      nav_link('Tech-News', social_media_path, style),
      nav_link('Blog', blogs_path, style),
      nav_link('Portfolio', portfolios_path, style)
    ]
  end

  def nav_link(text, path, style, method: :get)
    link_to(text, path, class: "#{style} #{active?(path)}", method: method)
  end

  def active?(path)
    'active' if current_page?(path)
  end
end
