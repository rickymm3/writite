class CliqsController < ApplicationController
  before_action :set_cliq, only: [:show, :edit, :update, :destroy]
  def index
    @search = params['search'] if params['search']
    @cliq = Cliq.find(7)
    @descendants = @cliq.descendants.select(:id).order("updated_at desc").limit(10).collect(&:id)
    @descendants << @cliq.id
    @topics = Topic.where(cliq_id: @descendants).order("updated_at desc").limit(10)
  end

  def show
    @search = params['search'] if params['search']
    @descendants = @cliq.descendants.select(:id).order("updated_at desc").limit(10).collect(&:id)
    @descendants << @cliq.id
    @topics = Topic.where(cliq_id: @descendants).order("updated_at desc").limit(10)
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
