class ReviewsController < ApplicationController

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    @shelter = Shelter.find(params[:shelter_id])
    @user = User.first
    review = @shelter.reviews.new(review_params)
    review[:user_id] = @user.id
    review.save
    redirect_to "/shelters/#{@shelter.id}"
  end

  private
  def review_params
    params.permit(:title, :rating, :content, :image, :name)
  end


end
