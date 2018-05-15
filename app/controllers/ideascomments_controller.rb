class IdeascommentsController < ApplicationController
  
  def create
  @idea = Idea.find params[:idea_id]
  ideas_params = params.require(:ideascomment).permit(:body)
  @ideascomment = Ideascomment.new ideas_params
  @ideascomment.user = current_user
  @ideascomment.idea = @idea
  @ideascomment.save
  redirect_to idea_path(@idea)
  end

  def destroy
    ideascomment = Ideascomment.find params[:id]
    ideascomment.destroy
    redirect_to idea_path(ideascomment.idea)
  end
end
