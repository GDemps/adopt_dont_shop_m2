class ShelterPetsController < ApplicationController

  def index
    @shelter = Shelter.find(params[:id])
  end

end
