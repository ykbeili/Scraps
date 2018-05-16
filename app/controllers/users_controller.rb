class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
    @user = User.new user_params
    if @user.save user_params
      session[:user_id] = @user.id
      byebug
      redirect_to home_path
    else
      render :new
    end
  end
end
