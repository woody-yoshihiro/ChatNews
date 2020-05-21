class HomeController < ApplicationController
  def index
    @clips = Clip.limit(8).order(cerated_at: :desc)
  end
end
