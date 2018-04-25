# frozen_string_literal: true

module PagesHelper
  # rubocop:disable Metrics/MethodLength
  def twitter_parser(tweet)
    regex = %r{
      \b
      (
        (?: [a-z][\w-]+:
         (?: /{1,3} | [a-z0-9%] ) |
          www\d{0,3}[.] |
          [a-z0-9.\-]+[.][a-z]{2,4}/
        )
        (?:
         [^\s()<>]+ | \(([^\s()<>]+|(\([^\s()<>]+\)))*\)
        )+
        (?:
          \(([^\s()<>]+|(\([^\s()<>]+\)))*\) |
          [^\s`!()\[\]{};:'".,<>?«»“”‘’]
        )
      )
    }ix

    tweet.gsub(regex) do |url|
      link_to(url, url, target: '_blank', class: 'btn btn-link')
    end.html_safe
  end
  # rubocop:enable Metrics/MethodLength
end
