# frozen_string_literal: true

class PagesController < ApplicationController
  def social_media
    @tweets = SocialMedia::Twitter.search('#rubyonrails')
    @tweets += SocialMedia::Twitter.search('sumcumo')
  end
end
