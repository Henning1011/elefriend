class PetsController < ApplicationController
  def index
    if params[:category].present?
      @pets = Pet.where(category: params[:category])
    else
      @pets = Pet.all
    end
    if params[:query].present?
      sql_subquery = <<~SQL
        pets.title @@ :query
        OR pets.description @@ :query
        OR pets.species @@ :query
        OR pets.pet_name @@ :query
      SQL
      @pets = @pets.where(sql_subquery, query: "%#{params[:query]}%")
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
