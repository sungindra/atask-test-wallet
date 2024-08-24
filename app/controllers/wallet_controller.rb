class WalletController < ApplicationController
  def index
    if current_user.blank?
      render plain: '401 Unauthorized', status: :unauthorized
    else
      @wallet = current_user.wallet
    end
  end
end
