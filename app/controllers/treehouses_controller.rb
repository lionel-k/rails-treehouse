class TreehousesController < ApplicationController
  def index
    @treehouses = Treehouse.where("location = ? AND capacity >= ?", params[:location], params[:capacity])

  def treehouses_params
    params.require(:location).permit(:capacity)
  end
end
