class TreehousesController < ApplicationController

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
