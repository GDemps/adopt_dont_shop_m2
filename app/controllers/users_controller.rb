class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    end
  end

  private
  def user_params
    params.permit(:name, :street_address, :city, :state, :zip)
  end

end
