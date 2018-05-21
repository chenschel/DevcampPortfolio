# frozen_string_literal: true

module BlogsHelper
  def archive_helper
    links = []
    years_and_month_with_blogs.each do |year, months|
      months.each do |month|
        links << archive_link(month, year)
      end
    end

    links.join.html_safe
  end

  def years_and_month_with_blogs
    blogs = Blog.by_created_at
    years_by_months = {}

    blogs.each do |blog|
      year = blog.created_at.year
      month = blog.created_at.month
      years_by_months[year] = [] if years_by_months[year].blank?
      years_by_months[year] << month unless years_by_months[year].include?(month)
    end

    years_by_months
  end

  def topic_blog_count_helper(topic)
    counter = []
    counter << topic.blogs.published.count
    counter << topic.blogs.draft.count if logged_in?(:site_admin)

    counter.join('/ draft:')
  end

  def blog_status_color(blog)
    'color: red;' if blog.draft?
  end

  private

  def archive_link(month, year)
    content_tag :li do
      link_to("#{t('date.month_names')[month]} #{year}", '#', class: 'btn btn-link')
    end
  end
end
