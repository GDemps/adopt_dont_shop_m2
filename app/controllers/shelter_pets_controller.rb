class ShelterPetsController < ApplicationController

  def index
    @shelter = Shelter.find(params[:shelter_id])
  end

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    @shelter = Shelter.find(params[:shelter_id])
    @shelter.pets.create(shelter_pets_params)
    redirect_to "/shelters/#{@shelter.id}/pets"
  end

  private
  def shelter_pets_params
    params.permit(:image, :name, :description, :approximate_age, :sex, :adoptable)
  end

end
