class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.limit(10).order(:created_at)
  end

  def show
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.cliq_id = params['cliq_id']
    @topic.user_id = current_user.id
    @cliq = Cliq.find(params['cliq_id'])
    @cliq.touch
    respond_to do |format|
      if @topic.save
        format.html { redirect_to [@topic.cliq, @topic], notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @topic }
      else
        format.html { render action: 'new' }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end

  end

  def new
    @topic = Topic.new(cliq_id: params[:cliq_id])
  end

  def destroy
  end

  def edit
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:subject, :body, :cliq_id)
  end

end
