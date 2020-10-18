require "rails_helper"

describe User, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :street_address }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :zip }
end

describe "instance method" do
  it "average_review_rating test" do
    shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    user_1 = User.create!(name: "Tom", street_address: "123 Tom ave", city: "Tomville", state: "CO", zip: 80011)
    review_1 = user_1.reviews.create!(title: "Great Pets", rating: 4, content: "We got a dog", image:"", name: user_1.name, shelter_id: shelter1.id)
    review_2 = user_1.reviews.create!(title: "Great Pets", rating: 1, content: "We got a cat", image:"", name: user_1.name, shelter_id: shelter1.id)

    expect(user_1.average_review_rating).to eq(2.5)
  end
end

describe "instance method" do
  it "best_rated_review test" do
    shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    user_1 = User.create!(name: "Tom", street_address: "123 Tom ave", city: "Tomville", state: "CO", zip: 80011)
    review_1 = user_1.reviews.create!(title: "Great Pets", rating: 4, content: "We got a dog", image:"", name: user_1.name, shelter_id: shelter1.id)
    review_2 = user_1.reviews.create!(title: "Great Pets", rating: 1, content: "We got a cat", image:"", name: user_1.name, shelter_id: shelter1.id)

    expect(user_1.best_rated_review).to eq(review_1)
  end
end

describe "instance method" do
  it "worst_rated_review test" do
    shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    user_1 = User.create!(name: "Tom", street_address: "123 Tom ave", city: "Tomville", state: "CO", zip: 80011)
    review_1 = user_1.reviews.create!(title: "Great Pets", rating: 4, content: "We got a dog", image:"", name: user_1.name, shelter_id: shelter1.id)
    review_2 = user_1.reviews.create!(title: "Great Pets", rating: 1, content: "We got a cat", image:"", name: user_1.name, shelter_id: shelter1.id)

    expect(user_1.worst_rated_review).to eq(review_2)
  end

describe "instance method" do
  it "reviews? to see if user has any reviews" do
    shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    user_1 = User.create!(name: "Ice Cube", street_address: "123 Compton Ave", city: "Compton", state: "CA", zip: 12345)
    user_2 = User.create!(name: "Dr. Dre", street_address: "123 Compton Ave", city: "Compton", state: "CA", zip: 12345)
    review_1 = user_2.reviews.create!(title: "Great Pets", rating: 4, content: "We got a dog", image:"", name: user_2.name, shelter_id: shelter1.id)

    expect(user_1.reviews?).to eq(false)
    expect(user_2.reviews?).to eq(true)
  end
end

end
