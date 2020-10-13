require 'rails_helper'

RSpec.describe 'Shelter show page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
    @user_1 = User.create!(name: "Tom", street_address: "123 Tom ave", city: "Tomville", state: "CO", zip: 80011)
    @review_1 = @user_1.reviews.create!(title: "Great Ptes", rating: 4, content: "We got a dog", image:"", name: @user_1.name, shelter_id: @shelter1.id)
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
end
