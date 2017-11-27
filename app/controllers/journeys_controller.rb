class JourneysController < ApplicationController

  def index
    @journeys = Journey.all
  end

  def create
    @journey = Journey.create(journey_params)
    @journey.save
    redirect_to journeys_path
  end

  private

  def journey_params
    params.require(:journey).permit(:checkin, :checkout, :guests_number, :is_confirmed, :user, :treehouse)
  end

end

