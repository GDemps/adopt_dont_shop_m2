class Review < ApplicationRecord
  belongs_to :shelter
  belongs_to :user

  validates_presence_of :title,
                        :content,
                        :rating

  def name_exists?
    users = User.pluck(:name)
    users.any?(name)
  end

  def name_match?
    name == user.name
  end

end
