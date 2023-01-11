# frozen_string_literal: true
class PagesController < ApplicationController
  def privacypolicy
    @title = "Privacy Policy"
    render 'pages/privacypolicy', layout: 'legal'
  end

  def termsofservice
    @title = "Terms of Service"
    render 'pages/termsofservice', layout: 'legal'
  end
end
