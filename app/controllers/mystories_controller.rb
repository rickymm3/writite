class MystoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit]
  before_action :set_story, only: [:update, :show, :edit, :publish]
  before_action :check_owner, only: [:update, :edit, :publish]
  def index
    if user_signed_in?
      @stories = Mystory.where(:user_id => current_user.id)
    end
  end

  def new
    @story = Mystory.new()
    @language = Language.all
  end

  def show
    @story.punch(request)
    @chapters = Chapter.where(mystory_id: @story.id).order(:created_at)
  end

  def create
    @story = Mystory.create(mystory_params.merge(user_id: current_user.id))
    if mystory_params[:new_tags]
      create_tags(mystory_params[:new_tags])
    end
    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @story }
      else
        format.html { render action: 'new' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @language = Language.all
  end

  def update
    @story = Mystory.find(params[:id])
    if mystory_params[:new_tags]
      create_tags(mystory_params[:new_tags])
    end
    respond_to do |format|
      if @story.update(mystory_params)
        format.js {render layout: false}
        format.html { redirect_to @story, notice: 'Item was successfully updated.' }
      end
    end
  end

  private

  def set_story
    @story = Mystory.find(params[:id])
  end

  def mystory_params
    params.require(:mystory).permit(:image,:title,:description,:language,:mature, :remove_image, :new_tags, :published)
  end

  def check_owner
    unless @story.user_id == current_user.id
      # head is equivalent to a rendering
      render :status => :forbidden, :text => "You do not have access to this action"
    end
  end

  def create_tags(t)
    tags = t.split(',')
    new_tags = Array.new
    tags.each do |tag|
      name = tag.strip
      if Tag.find_by(name:name.downcase)
        new_tags << Tag.find_by(name:name.downcase)
      else
        new_tags << Tag.create(name:name.downcase)
      end
    end
    new_tags.each do |new_tag|
      TagsMystory.create(mystory_id:@story.id, tag_id:new_tag.id )
    end
  end
end