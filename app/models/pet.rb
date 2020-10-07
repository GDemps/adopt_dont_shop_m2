class Pet < ApplicationRecord
  belongs_to :shelter

  def adoptable?
    if self.adoptable == true
      "Adoptable"
    else
      "Pending Adoption"
    end
  end
end
