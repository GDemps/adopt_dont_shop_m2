class ReviewsController < ApplicationController

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @shelter = Shelter.find(params[:shelter_id])
    @user = User.where(name: params[:name]).first
    @review = @shelter.reviews.new(review_params)
    @review[:user_id] = @user.id
    if @review.name_exists? && @review.name_match? && @review.save
      redirect_to "/shelters/#{@shelter.id}"
    elsif @review.name_exists? == false
      flash.now[:notice] = "No user with the name #{@review.name}"
      render :new
    elsif @review.name_match? == false
      flash.now[:notice] = "Only #{@review.name} can sign this review"
      render :new
    elsif @review.save == false
      flash.now[:notice] = @review.errors.full_messages.uniq.to_sentence
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to "/shelters/#{@review.shelter_id}"
    else
      flash.now[:notice] = @review.errors.full_messages.uniq.to_sentence
      render :edit
    end
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
