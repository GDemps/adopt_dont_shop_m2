class Pet < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :name, :description, :approximate_age, :sex

  def adoptable?
    if self.adoptable == true
      "Adoptable"
    else
      "Pending Adoption"
    end
  end
end
