class TagsController < ApplicationController

  def index

  end

  def show

  end

  def filter_tag
    @stories = get_stories(params[:tags][:search_tag])
    respond_to do |format|
      if @stories
        format.js
      else
        format.js
      end
    end
  end

  private

  def get_stories(filter)
    if Tag.where(name:filter).present?
      @filters = Tag.where(name:filter)
      @story_ids = TagsMystory.where(tag_id:@filters.first.id)
      Mystory.where(id:@story_ids)
    end
  end
end