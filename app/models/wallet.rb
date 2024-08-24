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
end
