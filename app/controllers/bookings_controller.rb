class BookingsController < ApplicationController
  before_action :set_pet, only: %i[create]
  before_action :set_booking, only: %i[accept reject]

  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pet = @pet
    @booking.user = current_user
    @booking.status = "pending"
    if @booking.save
      redirect_to dashboard_path
    else
      render 'pets/show', status: :unprocessable_entity
    end
  end

  def accept
    @booking.status = "accepted"
    @booking.save
  end

  def reject
    @booking.status = "rejected"
    @booking.save
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :message)
  end
end
