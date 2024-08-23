# == Schema Information
#
# Table name: users
#
#  id                    :bigint           not null, primary key
#  email                 :string
#  password_digest       :string
#  password_confirmation :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class User < ApplicationRecord
  has_secure_password :password, validations: true
  validates :email, presence: true, uniqueness: true
end
