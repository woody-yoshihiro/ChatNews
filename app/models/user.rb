class User < ApplicationRecord
  has_many :user_clips
  has_many :clips, through: :user_clips
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
