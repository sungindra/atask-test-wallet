class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = "Login failed"
      redirect_to new_user_session_path
    end
  end

  def destroy
    session.delete(:user_id)
    head :no_content
  end
end
