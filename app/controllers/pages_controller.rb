# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @skills = Skill.all
  end

  def about
    @skills = Skill.all
  end

  def contact; end

  def social_media
    @tweets = SocialMedia::Twitter.search('#rubyonrails')
    @tweets += SocialMedia::Twitter.search('sumcumo')
  end
end
