class Review < ApplicationRecord
  belongs_to :shelter
  belongs_to :user

  validates_presence_of :title,
                        :content,
                        :rating
end
