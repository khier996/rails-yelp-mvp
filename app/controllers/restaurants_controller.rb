class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    parameters = params.require(:restaurant).permit(:name, :address, :category, :phone_number)
    @restaurant = Restaurant.create(parameters)

    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end
  end
end
