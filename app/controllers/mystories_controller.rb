class MystoriesController < ApplicationController

  def index
    @stories = Mystory.where(:user_id => current_user.id)
  end

  def new
    @story = Mystory.new()
    @language = Language.all
  end

  def show
    @story = Mystory.find(params[:id])
    @chapters = Chapter.where(mystory_id: @story.id)
  end

  def create
    @story = Mystory.create(title: params[:mystory][:title],
                            user_id: current_user.id,
                            description: params[:mystory][:description],
                            language:params[:mystory][:language],
                            mature:params[:mystory][:mature])
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

  private

  def check_owner
    unless @story.user_id == current_user.id
      # head is equivalent to a rendering
      render :status => :forbidden, :text => "You do not have access to this action"
    end
  end

end