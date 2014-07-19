class CliqsController < ApplicationController
  before_action :set_cliq, only: [:show, :edit, :update, :destroy]
  def index
    @categories = Cliq.where(is_category: true)
  end

  def show
    @descendants = @cliq.descendants.order("updated_at desc").limit(10)
    @descendants << @cliq
    @topics = @cliq.topic
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cliq
    @cliq = Cliq.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cliq_params
    params.require(:cliq).permit(:subject, :body, :user_id)
  end
end
