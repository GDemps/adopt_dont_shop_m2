require 'rails_helper'

describe "Edit" do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @user_1 = User.create!(name: "Tom", street_address: "123 Tom ave", city: "Tomville", state: "CO", zip: 80011)
    @review_1 = @user_1.reviews.create!(title: "Great Pets", rating: 4, content: "We got a dog", image:"", name: @user_1.name, shelter_id: @shelter1.id)
  end
  it "can update a review" do
    visit "/reviews/#{@review_1.id}/edit"
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

  it "Can't update a review with empty Title, Rating and/or Content tags and provides a flash message" do
    visit "/reviews/#{@review_1.id}/edit"

    title = "Horrific Shelter"
    rating = 1
    content = ""
    image = ""
    name = "Tom"


    fill_in :title, with: " "
    fill_in :rating, with: " "
    fill_in :content, with: " "
    fill_in :image, with: image
    fill_in :name, with: name

    click_on 'Update Review'
    
    expect(page).to_not have_content("Horrific Shelter")
    expect(current_path).to eq("/reviews/#{@review_1.id}")
    expect(page).to have_content("Title can't be blank, Content can't be blank, and Rating can't be blank")
  end
end
