class CliqsController < ApplicationController
  before_action :set_cliq, only: [:index, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @search = params[:search] if params[:search]
    @descendants = @cliq.descendants.select(:id).order("updated_at desc").limit(10).collect(&:id)
    @descendants << @cliq.id
    @topics = Topic.where(cliq_id: @descendants).order("updated_at desc").limit(10)
  end

  def show
    set_search(params[:search])
    unless @search['temp']
      @descendants = @cliq.descendants.select(:id).order("updated_at desc").limit(10).collect(&:id)
      @descendants << @cliq.id
    end
    @topics = Topic.where(cliq_id: @descendants).order("updated_at desc").limit(10)
  end

  def new
    current_cliq = Cliq.find(params[:cliq_id])
    @cliq = Cliq.new(name:params[:new], parent: current_cliq)
    @create = true
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cliq
    if params[:id]
      cliq = params[:id]
    else
      cliq = 1
    end
    @cliq = Cliq.find(cliq)
    @ancestors = @cliq.ancestors
    @cliq_ancestors = @ancestors << @cliq
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cliq_params
    params.require(:cliq).permit(:subject, :body, :user_id)
  end

  def set_search(search)
    @search = {'match' => nil}
    @search = Cliq.search(search, @cliq) if params[:search]
    #automatically return the correct search if it matches
    redirect_to(@search['match']) if @search['match'].present?
  end

end
