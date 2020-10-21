class Shelter < ApplicationRecord
  has_many :pets
  has_many :reviews

  def num_of_pets
    pets.count
  end

  def avg_rating
    reviews.average(:rating).to_f
  end

  def total_apps
    pets.select('pets.*, applications.*').joins(:applications).to_a.count
  end
end
