class Review < ApplicationRecord
  belongs_to :shelter
  belongs_to :user

  validates_presence_of :title,
                        :content,
                        :rating

  def name_match?
    users = User.pluck(:name)
    users.any?(name)
  end
end
