class TreehousesController < ApplicationController

  def index
    @treehouses = Treehouse.where("location = ? AND capacity >= ?", params[:location], params[:capacity])
  end

  private

  def treehouses_params
    params.require(:treehouses).permit(:capacity, :location, :checkin, :checkout)
  end
end
