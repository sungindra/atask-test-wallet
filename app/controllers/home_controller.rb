class HomeController < ApplicationController
  def index
    if current_user
      redirect_to wallet_path
    end
  end
end
