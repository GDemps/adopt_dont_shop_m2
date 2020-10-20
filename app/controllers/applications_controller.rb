class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def new
    @pet = Pet.find(params[:id])
  end

  def create
    if @user = User.find_by(name: params[:applicant])
      @application = @user.applications.new(application_params)
      @application.application_status = "In Progress"
      @application.save
      ApplicationPet.create(application_id: @application.id, pet_id: params[:id])
      redirect_to "/applications/#{@application.id}"
    else
      flash.now[:notice] = "No user with the name #{params[:name]}"
      @pet = Pet.find(params[:id])
      render :new
    end
  end

  private
  def application_params
    params.permit(:applicant, :address, :description)
  end
end
