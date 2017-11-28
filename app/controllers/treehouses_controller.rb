class TreehousesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :show

  def index
    @treehouses = Treehouse.where("location = ? AND capacity >= ?", params[:location], params[:capacity])
  end

  def show
    @treehouse = Treehouse.find(params[:id])
    @journey = Journey.new
  end

  private
  def treehouses_params
    params.require(:treehouses).permit(:capacity, :location, :checkin, :checkout)
  end

end
