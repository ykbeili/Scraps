class ScrapscommentsController < ApplicationController
  
  def create
  @scrap = Scrap.find params[:scrap_id]
  scrap_params = params.require(:scrapscomment).permit(:body)
  @scrapscomment = Scrapscomment.new scrap_params
  @scrapscomment.user = current_user
  @scrapscomment.scrap = @scrap
  @scrapscomment.save
  redirect_to scrap_path(@scrap)
  end

  def destroy
    scrapscomment = Scrapscomment.find params[:id]
    scrapscomment.destroy
    redirect_to scrap_path(scrapscomment.scrap)
  end
end
