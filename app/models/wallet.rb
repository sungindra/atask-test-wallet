# == Schema Information
#
# Table name: wallets
#
#  id         :bigint           not null, primary key
#  balance    :integer
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Wallet < ApplicationRecord
  belongs_to :user
  has_many :transactions

  validates :balance, numericality: {greater_than_or_equal_to: 0}

  def refresh_balance!
    new_balance = 0
    self.transactions.each do |t|
      if t.withdraw?
        new_balance -= t.amount
      else
        new_balance += t.amount
      end
    end
    self.balance = new_balance
    self.save!
  end

  def withdraw (amount)
    t = Transaction.new
    t.transaction_type = :withdraw
    t.amount = amount
    t.wallet_id = self.id
    t.save!

    self.refresh_balance!
  end
  
  def deposit (amount)
    t = Transaction.new
    t.transaction_type = :deposit
    t.amount = amount
    t.wallet_id = self.id
    t.save!

    self.refresh_balance!
  end
end
