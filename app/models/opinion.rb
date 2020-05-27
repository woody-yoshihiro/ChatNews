class Opinion < ApplicationRecord
  belongs_to :clip, counter_cache: true
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { minimum: 3 }
  validates :body, presence: true, length: { minimum: 30 }
end
