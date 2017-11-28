class PagesController < ApplicationController
  skip_after_action pundit :home

  def home
  end
end
