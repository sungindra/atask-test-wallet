class HomeController < ApplicationController
  def index
    if current_user
      redirect_to wallet_index_path
    end
  end
end
