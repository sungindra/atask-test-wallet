class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to wallet_index_path
    else
      flash[:alert] = "Login failed"
      redirect_to signin_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
