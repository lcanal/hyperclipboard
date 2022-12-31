# frozen_string_literal: true
class PagesController < ApplicationController
  def delete
    @clips = Clip.all
  end
end
