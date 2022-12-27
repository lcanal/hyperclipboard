class PagesController < ApplicationController
  def home
    @clips = Clip.all
  end
end
