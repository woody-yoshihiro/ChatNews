class Clip < ApplicationRecord
  before_save :create_page
  has_many :user_clips
  has_many :users, through: :user_clips
  has_many :opinions, dependent: :destroy

  def create_page
    begin
      page = MetaInspector.new(url)
      self.title = page.title
      self.description = page.best_description
      self.image = page.images.best
    rescue => error
      errors.add(:base, "無効なURLです")
      throw :abort
    end
  end
end
