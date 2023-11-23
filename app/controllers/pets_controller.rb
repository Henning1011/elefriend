class PetsController < ApplicationController
  # before_action :set_pet, only: %i[create]
  def index
    if params[:category].present?
      @pets = Pet.where(category: params[:category])
    else
      @pets = Pet.all
    end
  end

  def show
    @pet = Pet.find(params[:id])
    @booking = Booking.new
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

private
  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:pet_name, :title, :description, :price, :category, :species, :location)
  end
end
