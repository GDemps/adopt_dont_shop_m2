class User < ApplicationRecord
  has_many :reviews
  validates_presence_of :name,
                         :street_address,
                         :city,
                         :state,
                         :zip

  def average_review_rating
    reviews.average(:rating).to_f.round(1)
  end
end
