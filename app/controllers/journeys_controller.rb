class JourneysController < ApplicationController

  def index
    @journeys = policy_scope(Journey).order(created_at: :desc)
  end

  def create
    @journey = Journey.new(journey_params)
    @journey.treehouse = Treehouse.find(params[:treehouse_id])
    @journey.user_id = current_user.id
    authorize @journey
    if @journey.save
      redirect_to journeys_path
    else
      render "treehouses#show"
    end
  end

  def validate
    journey = Journey.find(params[:id])
    authorize journey
    journey.is_confirmed = params[:status] == "accepted" ? true : false
    journey.save
    # raise
    redirect_to journeys_path
  end

  private

  def journey_params
    params.require(:journey).permit(:checkin, :checkout, :guests_number, :is_confirmed, :treehouse_id)
  end
end

