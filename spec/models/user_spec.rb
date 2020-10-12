require "rails_helper"

describe User, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :street_address }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :zip }
end
