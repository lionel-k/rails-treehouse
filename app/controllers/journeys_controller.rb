class JourneysController < ApplicationController

  def index
    @journeys = Journey.all
  end


end
