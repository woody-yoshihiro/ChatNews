class Like < ApplicationRecord
  belongs_to :opinion
  belongs_to :user
  validates_uniqueness_of :opinion_id, scope: :user_id
end
