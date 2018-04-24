# frozen_string_literal: true

module SocialMedia
  class Twitter
    def self.search(query_string)
      client.search(query_string, result_type: 'recent', lang: 'de').take(4).collect do |tweet|
        "#{tweet.user.screen_name}: #{tweet.text}"
      end
    end

    def self.client
      ::Twitter::REST::Client.new do |config|
        config.consumer_key = ENV.fetch('YOUR_CONSUMER_KEY')
        config.consumer_secret = ENV.fetch('YOUR_CONSUMER_SECRET')
        config.access_token = ENV.fetch('YOUR_ACCESS_TOKEN')
        config.access_token_secret = ENV.fetch('YOUR_ACCESS_SECRET')
      end
    end

    private_class_method :client
  end
end
