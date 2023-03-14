class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy
end
