class TreehousesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :show
  before_action :treehouses_params, only: [:index]

  def index
    @treehouses = Treehouse.where("location = ? AND capacity >= ?", params[:treehouses][:location], params[:treehouses][:guests_number])
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
