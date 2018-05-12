class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email params[:session][:email]
    if @user && @user.authenticate(params[:session][:password])
      session[:user] = @user.id
      redirect_to home_path, notice:  "Logged in"
    else
      render :new
  end
 end

 def destroy
    session[:user] = nil
    redirect_to home_path, notice: "Logged out"
 end
end
