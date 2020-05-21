class Clip < ApplicationRecord
  before_save :create_page

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
