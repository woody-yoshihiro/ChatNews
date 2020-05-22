class HomeController < ApplicationController
  def index
    @clips = Clip.limit(8).order(created_at: :desc)
  end
end
