class HomeController < ApplicationController
  def index
    @featured = get_featured_stories
    @popular_tags = get_popular_tags
    @popular_reads = Mystory.most_hit(1.week.ago, 10)
  end

  private

  def get_popular_tags
    tags = TagsMystory.select(:tag_id).joins(:tag).group(:tag_id).order('count_tag_id desc').limit(10).count
    tag_list = Hash.new
    tags.each do |k,v|
      tag_list[Tag.find(k)] = v
    end
    tag_list
  end

  def get_featured_stories
    Mystory.where(featured:true).limit(5).order(created_at: "DESC")
  end
end