# frozen_string_literal: true

module CommentsHelper
  def avatar_helper(comment)
    var_part = "#{comment.blog.friendly_id}#{comment.id}#{comment.blog.id}#{comment.user.id}"
    url = "https://api.adorable.io/avatars/50/#{var_part}.png"
    image_tag url, class: 'img-fluid'
  end
end
