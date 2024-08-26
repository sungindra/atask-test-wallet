class TransactionsController < ApplicationController
  def withdraw_form; end

  def withdraw
    if current_user.wallet.balance < params[:amount]
      flash[:alert] = "Not enough balance!"
      redirect_to withdraw_path
    else
      if current_user.wallet.withdraw params[:amount]
        redirect_to wallet_index_path
      end
    end
  end

  def deposit_form; end

  def deposit
    if current_user.wallet.deposit params[:amount]
      redirect_to wallet_index_path
    end
  end

  def transfer_form; end

  def transfer
    if params[:recepient_id] == current_user.wallet.id
      flash[:alert] = "Can't transfer to your own wallet"
      return redirect_to transfer_path
    end

    if current_user.wallet.balance < params[:amount]
      flash[:alert] = "Not enough balance!"
      return redirect_to transfer_path
    end

    recepient = Wallet.find_by id: params[:recepient_id]
    if !recepient
      flash[:alert] = "Recepient wallet not found!"
      return redirect_to transfer_path
    end

    current_user.wallet_withdraw params[:amount]
    recepient.deposit params[:amount]
    redirect_to wallet_index_path
  end
end
