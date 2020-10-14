class ReviewsController < ApplicationController

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    @shelter = Shelter.find(params[:shelter_id])
    @user = User.first
      review = @shelter.reviews.new(review_params)
      review[:user_id] = @user.id
    if review.save
      redirect_to "/shelters/#{@shelter.id}"
    else
      flash.now[:notice] = review.errors.full_messages.uniq
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to "/shelters/#{review.shelter_id}"
  end

  def destroy
    review = Review.find(params[:id])
    shelter_id = review.shelter_id
    Review.destroy(params[:id])
    redirect_to "/shelters/#{shelter_id}"
  end

  private
  def review_params
    params.permit(:title, :rating, :content, :image, :name)
  end


end
