class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
     restaurant = Restaurant.find(params[:restaurant_id])
     parameters = params.require(:review).permit(:content, :rating)
     review = Review.new(parameters)
     review.restaurant_id = restaurant.id
     review.save

     redirect_to restaurant_path(restaurant)
  end
end
