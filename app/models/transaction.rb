# == Schema Information
#
# Table name: transactions
#
#  id               :bigint           not null, primary key
#  amount           :integer
#  transaction_type :string
#  wallet_id        :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Transaction < ApplicationRecord
  enum :transaction_type, [:deposit, :withdraw]
  belongs_to :wallet
end
