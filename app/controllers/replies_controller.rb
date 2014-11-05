class RepliesController < ApplicationController
  before_action :set_topic, only: [:new, :create]
  before_action :authenticate_user!, :only => [:new, :create]
  def new
    @reply = Reply.new(topic_id: @topic.id)
  end

  def create
    @reply = Reply.create(body: params[:reply][:body], user_id: current_user.id, topic_id: params[:topic_id])
    respond_to do |format|
      if @reply.save
        @topic.touch
        format.html { redirect_to @topic, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @topic }
      else
        format.html { render action: 'new' }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  private

  def reply_params
    params.require(:body)
  end

end
