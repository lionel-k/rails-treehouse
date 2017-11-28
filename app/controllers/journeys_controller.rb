class JourneysController < ApplicationController

  def index
    @journeys = policy_scope(Journey).order(created_at: :desc)
  end

  def create
    @journey = Journey.new(journey_params)
    @journey.user_id = current_user.id
    if @journey.save
      redirect_to journeys_path
    else
      redirect_to treehouse_path
    end
  end

  private

  def journey_params
    params.require(:journey).permit(:checkin, :checkout, :guests_number, :is_confirmed, :treehouse_id)
  end

end

