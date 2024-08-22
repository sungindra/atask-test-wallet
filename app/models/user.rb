# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  email              :string
#  encrypted_password :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class User < ApplicationRecord
  has_secure_password :encrypted_password

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true 
end
