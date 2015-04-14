class HomeController < ApplicationController
  def index
    @featured = get_featured_stories
  end

  private

  def get_featured_stories
    Mystory.all.limit(10)
  end
end