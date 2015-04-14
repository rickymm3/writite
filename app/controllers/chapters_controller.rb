class ChaptersController < ApplicationController
  before_action :set_story, only: [:new, :show, :create]
  before_action :check_owner, only: [:new, :create]

  def index
    @next_chapter = next_chapter(@story, @chapter.number)
  end

  def new
    @chapters = Chapter.where(mystory_id: @story.id)
    @chapter = Chapter.new(mystory_id: @story.id)
  end

  def show
    @chapter = Chapter.find(params[:id])
    @next_chapter = next_chapter(@story, @chapter.number)
  end

  def create
    @chapter = Chapter.create(chapter_text: params[:chapter][:chapter_text],
                            mystory_id: params[:mystory_id],
                            number: new_chapter_number(@story),
                            title: params[:chapter][:title])
    respond_to do |format|
      if @chapter.save
        format.html { redirect_to mystory_chapter_path(@chapter.mystory, @chapter), notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @chapter }
      else
        format.html { render action: 'new' }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def check_owner
    unless @story.user_id == current_user.id
      # head is equivalent to a rendering
      render :status => :forbidden, :text => "You do not have access to this action"
    end
  end

  def set_story
    @story = Mystory.find(params[:mystory_id])
  end

end