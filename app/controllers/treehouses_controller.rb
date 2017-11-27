class TreehousesController < ApplicationController
  def index
    @treehouses = Treehouse.where("location = ? AND capacity >= ?", params[:location], params[:capacity])
  end

  def treehouses_params
    params.require(:location).permit(:capacity)
  end
end
