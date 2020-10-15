require 'rails_helper'

RSpec.describe 'Shelter show page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
    @user_1 = User.create!(name: "Tom", street_address: "123 Tom ave", city: "Tomville", state: "CO", zip: 80011)
    @review_1 = @user_1.reviews.create!(title: "Great Pets", rating: 4, content: "We got a dog", image:"", name: @user_1.name, shelter_id: @shelter1.id)
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

    expect(current_path).to eq("/reviews/#{@review_1.id}/edit")

    fill_in :title, with: "Not so great pets"
    fill_in :rating, with: 2
    fill_in :content, with: "Horrible shelter and horrible pets"
    fill_in :image, with: ""
    fill_in :name, with: "Tom"

    click_button("Update Review")

    within "#review-#{@review_1.id}" do
      expect(page).to have_content(2)
      expect(page).to have_content("Horrible shelter and horrible pets")
      expect(page).to have_content("")
      expect(page).to have_content("Tom")
    end

    expect(current_path).to eq("/shelters/#{@shelter1.id}")
  end

  it "Has a delete link for shelters reviews" do
    visit "/shelters/#{@shelter1.id}"

    within "#review-#{@review_1.id}" do
      expect(page).to have_link("Delete Review")
    end
  end
  it "Will not create edit a review without required fields of title, rating, and/or content" do
    visit "/reviews/#{@review_1.id}/edit"

    title = "Horrific Shelter"
    rating = 1
    content = ""
    image = ""
    name = "Tom"

    fill_in :title, with: title
    fill_in :rating, with: rating
    fill_in :content, with: ""
    fill_in :image, with: image
    fill_in :name, with: name

    save_and_open_page
    click_on 'Update Review'
    expect(page).to_not have_content("Horrific Shelter")
    expect(current_path).to eq("/shelters/#{@shelter1.id}/reviews")
    expect(page).to have_content("Content can't be blank")
  end
end
