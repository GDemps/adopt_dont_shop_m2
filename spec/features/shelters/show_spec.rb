require 'rails_helper'

RSpec.describe 'Shelter show page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
    @shelter3 = Shelter.create!(name: "Awful Place", address: "123 Bad", city: "Tuscon", state: "AZ", zip: 12345)
    @user_1 = User.create!(name: "Tom", street_address: "123 Tom ave", city: "Tomville", state: "CO", zip: 80011)
    @user_2 = User.create!(name: "Tammy", street_address: "123 Tammy ave", city: "Tammyville", state: "CO", zip: 80044)
    @review_1 = @user_1.reviews.create!(title: "Great Pets", rating: 4, content: "We got a dog", image:"", name: @user_1.name, shelter_id: @shelter1.id)
    @review_2 = @user_2.reviews.create!(title: "Awful", rating: 1, content: "Ugly Pets", image:"", name: @user_2.name, shelter_id: @shelter1.id)
    @review_3 = @user_2.reviews.create!(title: "Awful", rating: 1, content: "Ugly Pets", image:"", name: @user_2.name, shelter_id: @shelter2.id)
    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
    @application1 = @user_1.applications.create!(applicant: @user_1.name, address: @user_1.street_address, description: "We have pet snacks", application_status: "Pending")
    @application2 = @user_2.applications.create!(applicant: @user_2.name, address: @user_2.street_address, description: "We love pets", application_status: "Pending")
    ApplicationPet.create!(application_id: @application1.id, pet_id: @pet1.id)
    ApplicationPet.create!(application_id: @application2.id, pet_id: @pet2.id)
    ApplicationPet.create!(application_id: @application1.id, pet_id: @pet3.id)
  end

  it "displays shelter with that id and all its attributes" do
    visit "/shelters/#{@shelter1.id}"

    expect(page).to have_content(@shelter1.name)
    expect(page).to have_content(@shelter1.address)
    expect(page).to have_content(@shelter1.city)
    expect(page).to have_content(@shelter1.state)
    expect(page).to have_content(@shelter1.zip)
  end

  it "has a link to that shelter's pets" do
    visit "/shelters/#{@shelter1.id}"

    expect(page).to have_link("#{@shelter1.name}'s Pets")

    click_link "#{@shelter1.name}'s Pets"

    expect(current_path).to eq("/shelters/#{@shelter1.id}/pets")
  end

  it "I see a list of reviews for that shelter" do

    visit "/shelters/#{@shelter1.id}"

    expect(page).to have_content(@review_1.title)
    expect(page).to have_content(@review_1.rating)
    expect(page).to have_content(@review_1.content)
    expect(page).to have_content(@review_1.image)
    expect(page).to have_content(@user_1.name)
  end

  it "I see a link to add a new review for this shelter." do

    visit "/shelters/#{@shelter1.id}"
    expect(page).to have_link("New Review")

    click_on("New Review")
    expect(current_path).to eq("/shelters/#{@shelter1.id}/reviews/new")

  end

  it "Can edit review with a link next to each review" do
    visit "/shelters/#{@shelter1.id}"

    within "#review-#{@review_1.id}" do
      expect(page).to have_content("Great Pets")
      click_link "Edit Review"
    end
  end

  it "Has a delete link for shelters reviews" do
    visit "/shelters/#{@shelter1.id}"

    within "#review-#{@review_1.id}" do
      expect(page).to have_link("Delete Review")
    end
  end

  it "I see statistics for that shelter: count of pets at that shelter, avg shelter review rating, number of applications on file" do
    visit "/shelters/#{@shelter1.id}"

    within "#statistics" do
      expect(page).to have_content("Number of Pets: 2")
      expect(page).to have_content("Average Review Rating: 2.5")
      expect(page).to have_content("Number of Applications: 2")
    end
  end
end
