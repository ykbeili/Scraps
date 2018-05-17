class YoursController < ApplicationController
  
  def index
    @my_ideas = current_user.ideas
    @my_scraps = current_user.scraps
  end
end
