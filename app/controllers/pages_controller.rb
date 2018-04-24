# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @skills = Skill.all
  end

  def about; end

  def contact; end

  def social_media
    @tweets = SocialMedia::Twitter.search('ruby on rails')
    @tweets += SocialMedia::Twitter.search('sumcumo')
  end
end
