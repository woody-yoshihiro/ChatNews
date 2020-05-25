class Opinion < ApplicationRecord
  belongs_to :clip, counter_cache: true
  belongs_to :user

  validates :title, presence: true, length: { minimum: 3 }
  validates :body, presence: true, length: { minimum: 30 }
end
