class User < ApplicationRecord
  has_many :reviews
  validates_presence_of :name,
                         :street_address,
                         :city,
                         :state,
                         :zip
end
