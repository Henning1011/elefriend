class BookingsController < ApplicationController
  before_action :set_pet, only: %i[create]

  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pet = @pet
    @booking.user = current_user
    # @booking = @pet.bookings.new(booking_params)
    if @booking.save
      redirect_to dashboard_path
    else
      render 'pets/show', status: :unprocessable_entity
    end
  end

  def accept
  end

  def reject
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def booking_params
    params.require(:booking).permit(:date, :message)
  end
end


# def create
#   @review = Review.new(review_params)
#   @review.restaurant = @restaurant
#   @review.save
#   redirect_to restaurant_path(@restaurant)
# end

# private

# def set_restaurant
#   @restaurant = Restaurant.find(params[:restaurant_id])
# end

# def review_params
#   params.require(:review).permit(:content)
# end
