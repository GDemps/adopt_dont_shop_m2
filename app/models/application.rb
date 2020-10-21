class Application < ApplicationRecord
  after_initialize :default_values

  belongs_to :user
  has_many :application_pets
  has_many :pets, through: :application_pets

  def default_values
    self.application_status ||= "In Progress"
  end

end
