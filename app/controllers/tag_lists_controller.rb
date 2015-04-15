class TagListsController < ApplicationController
  def show
    unless @search['temp']
      @descendants = @cliq.descendants.select(:id).order("updated_at desc").limit(10).collect(&:id)
      @descendants << @cliq.id
    end
    if @filter
      @topics = Topic.where(cliq_id: @descendants).order("exp desc").limit(10)
    else
      @topics = Topic.where(cliq_id: @descendants).order("updated_at desc").limit(10)
    end
  end
end