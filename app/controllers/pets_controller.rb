class PetsController < ApplicationController
  def index
    if params[:category].present?
      @pets = Pet.where(category: params[:category])
    else
      @pets = Pet.all
    end
  end

  def show
    @pet = Pet.find(params[:id])
    @booking = @pet.bookings.new
  end
end
