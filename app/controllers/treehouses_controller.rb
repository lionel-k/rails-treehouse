class TreehousesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :show
  before_action :treehouses_params, only: [:index]

  def index
    raise
    @treehouses = Treehouse.where("location = ? AND capacity >= ?", params[:treehouses][:location], params[:treehouses][:guests_number])
  end

  def new
    @treehouse = Treehouse.new
    authorize @treehouse
  end

  def create
    @treehouse = Treehouse.new(treehouse_params)
    @treehouse.user = current_user
    authorize @treehouse
    if @treehouse.save
      redirect_to treehouse_path(@treehouse)
    else
      render :new
    end
  end

  def show
    @treehouse = Treehouse.find(params[:id])
    @journey = Journey.new
  end

  private
  def treehouses_params
    params.require(:treehouses).permit(:capacity, :location, :checkin, :checkout)
  end

  def treehouse_params
    params.require(:treehouse).permit(:title, :capacity, :description, :location, :price_per_night)
  end
end
