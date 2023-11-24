class BookingsController < ApplicationController
  before_action :set_pet, only: %i[create]
  before_action :set_booking, only: %i[accept reject]

  def index
    @bookings = Booking.all
  end

  def create
    if user_signed_in?
      @booking = Booking.new(booking_params)
      @booking.pet = @pet
      @booking.user = current_user
      @booking.status = "pending"
      if @booking.save
        redirect_to dashboard_path
      else
        render 'pets/show', status: :unprocessable_entity
      end
    else
      redirect_to new_user_session_path, alert: "You need to be logged in to create a booking."
    end
  end

  def accept
    @booking.status = "accepted"
    @booking.save
    # redirect_to dashboard_path(anchor: "requests-tab-pane"), notice: "Request processed."
  end

  def reject
    @booking.status = "rejected"
    @booking.save
    # redirect_to dashboard_path(anchor: "requests-tab-pane"), notice: "Request processed."
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
