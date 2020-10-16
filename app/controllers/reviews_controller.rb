class ReviewsController < ApplicationController

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @shelter = Shelter.find(params[:shelter_id])
    if User.where(name: params[:name]) != []
      @user = User.where(name: params[:name]).first
      @review = @shelter.reviews.new(review_params)
      @review[:user_id] = @user.id
      if @review.save
        redirect_to "/shelters/#{@shelter.id}"
      else
        flash.now[:notice] = @review.errors.full_messages.uniq.to_sentence
        render :new
      end
    else
      flash.now[:notice] = "No user with the name #{params[:name]}"
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    if User.where(name: params[:name]) != []
      @review = Review.find(params[:id])
      if @review.update(review_params)
        redirect_to "/shelters/#{@review.shelter_id}"
      else
        flash.now[:notice] = @review.errors.full_messages.uniq.to_sentence
        render :edit
      end
    else
      @review = Review.find(params[:id])
      flash.now[:notice] = "No user with the name #{params[:name]}"
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
