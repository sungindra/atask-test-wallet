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
require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
