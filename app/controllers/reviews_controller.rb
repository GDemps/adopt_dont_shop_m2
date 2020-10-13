class ReviewsController < ApplicationController

  def new
    @shelter = Shelter.find(params[:shelter_id])
    binding.pry
  end

  def create
    @shelter = Shelter.find(params[:shelter_id])
    binding.pry
    @review = Review.new(review_params)
  end

  private
  def review_params
    params.permit(:title, :rating, :content, :image, :name,)
  end


end
