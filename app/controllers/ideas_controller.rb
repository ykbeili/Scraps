class IdeasController < ApplicationController
  before_action :find_ideas, only: [:show,:update,:edit,:destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user!, only: [:edit,:update,:destroy]

  def new
    @idea = Idea.new
  end

  def index
    @search_param = params[:search]
    @ideas = Idea.search(@search_param)
  end

  def create
    @idea = Idea.new idea_params
    @idea.user = current_user
    if @idea.save
      redirect_to ideas_path
    else
      render :new
    end
  end

  def show
    @idea = Idea.find params[:id]
    @ideascomments = @idea.ideascomments
    @ideascomment = Ideascomment.new
  end

  def update
    if @idea.update idea_params
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path
  end

  private

  def authorize_user!
    unless can?(:manage,@idea)
      flash[:alert] = 'Access Denied'
      redirect_to idea_path(@idea)
    end
  end

   def idea_params
    params.require(:idea).permit(:title,:description)
  end

   def find_ideas
    @idea = Idea.find params[:id]
   end
  end
