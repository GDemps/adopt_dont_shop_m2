class User < ApplicationRecord
  has_many :reviews
  has_many :applications
  validates_presence_of :name,
                         :street_address,
                         :city,
                         :state,
                         :zip

  def average_review_rating
    reviews.average(:rating).to_f.round(1)
  end

  def best_rated_review
    reviews.order(rating: :desc).first
  end

  def worst_rated_review
    reviews.order(rating: :asc).first
  end

  def reviews?
    !reviews.empty?
  end
end
