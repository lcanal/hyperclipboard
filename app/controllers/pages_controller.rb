# frozen_string_literal: true
class PagesController < ApplicationController
  def home
    @clips = Clip.all
  end
end
