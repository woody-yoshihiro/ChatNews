class Opinion < ApplicationRecord
  belongs_to :clip, counter_cache: true
  belongs_to :user

  validates :title, :body, presence: true, length: { minimum: 3 }
end
