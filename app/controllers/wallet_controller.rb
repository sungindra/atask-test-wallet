class WalletController < ApplicationController
  def index
    @wallet = current_user.get_wallet
  end
end
