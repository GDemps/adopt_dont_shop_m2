class Pet < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :name, :description, :approximate_age, :sex

  has_many :application_pets
  has_many :applications, through: :application_pets

  def adoptable?
    if self.adoptable == true
      "Adoptable"
    else
      "Pending Adoption"
    end
  end
end
