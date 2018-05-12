class ScrapsController < ApplicationController
  before_action :find_scraps, only: [:show,:update,:destroy,:edit]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user!, only: [:edit,:update,:destroy]
  def new
    @scrap = Scrap.new
  end

  def create
    @scrap = Scrap.new scrap_params
    @scrap.user = current_user
    if @scrap.save
      redirect_to scraps_path
    else
      render :new
    end
  end

  def index
    @scraps = Scrap.order(created_at: :desc)
  end

  def show
    @scrap = Scrap.find params[:id]
    @scrapscomments = @scrap.scrapscomments
    @scrapscomment = Scrapscomment.new
  end

  def update
    if @scrap.update scrap_params
      redirect_to scrap_path(@scrap)
    else
      render :edit
    end
  end

  def destroy
    @scrap.destroy
    redirect_to scraps_path
  end

  private
  def authorize_user!
    unless can?(:manage,@scrap)
      flash[:alert] = 'Access Denied'
      redirect_to scrap_path(@scrap)
    end
  end
  def find_scraps
    @scrap = Scrap.find params[:id]
  end
  def scrap_params
    params.require(:scrap).permit(:title,:description)
  end
end
