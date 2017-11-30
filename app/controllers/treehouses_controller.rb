class TreehousesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :show
  before_action :treehouses_params, only: [:index]

  def index
    if params[:treehouses][:location].blank?
      @treehouses = Treehouse.all
    else
      guests_number =  params[:treehouses][:guests_number].blank? ? 0 : params[:treehouses][:guests_number]
      @treehouses = Treehouse.where("capacity >= ?", guests_number)
      @treehouses = @treehouses.near(params[:treehouses][:location], 100)
    end
    treehouses_flags = @treehouses.where.not(latitude: nil, longitude: nil)
    @markers = treehouses_flags.map do |treehouse|
      {
        lat: treehouse.latitude,
        lng: treehouse.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
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
    params.require(:treehouse).permit(:title, :capacity, :description, :location, :price_per_night, :photo)
  end
end
