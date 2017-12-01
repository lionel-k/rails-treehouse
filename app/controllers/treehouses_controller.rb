class TreehousesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :show

  def index
    if params[:treehouses]
      @search_params = {treehouse_checkin: params[:treehouses][:checkin].first, treehouse_checkout: params[:treehouses][:checkout].first, treehouse_guests_number: params[:treehouses][:guests_number], treehouse_price_per_night: params[:treehouses][:price_per_night]}
      if params[:treehouses][:location].blank?
        @treehouses = Treehouse.all
      else
        guests_number =  params[:treehouses][:guests_number].blank? ? 0 : params[:treehouses][:guests_number]
        @treehouses = Treehouse.where("capacity >= ?", guests_number)
        @treehouses = @treehouses.near(params[:treehouses][:location], 100)
      end
    else
      @treehouses = Treehouse.all
      @search_params = {}
    end
    treehouses_flags = @treehouses.where.not(latitude: nil, longitude: nil)

    @markers = treehouses_flags.map do |treehouse|
      @treehouse_for_view = treehouse
      {
        lat: treehouse.latitude,
        lng: treehouse.longitude,
        icon: "https://res.cloudinary.com/dqwxvdtnv/image/upload/v1512067586/yus79fy3kdontkwneo1y.png",
        infoWindow: { content: render_to_string(partial: "/treehouses/map_box", locals: { treehouse: @treehouse_for_view }) }
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

  def treehouse_params
    params.require(:treehouse).permit(:title, :capacity, :description, :location, :price_per_night, :photo)
  end
end
