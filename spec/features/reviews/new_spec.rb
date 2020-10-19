require "rails_helper"

describe "I am taken to a new review path" do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @user_1 = User.create!(name: "Tom", street_address: "123 Tom ave", city: "Tomville", state: "CO", zip: 80011)
    @user_2 = User.create!(name: "Jim", street_address: "321 Jim St", city: "Jimville", state: "CO", zip: 80012)
  end

  it "On this new page, I see a form where I must enter params" do
    visit "/shelters/#{@shelter1.id}/reviews/new"

    title = "Awful Place"
    rating = 1
    content = "A dog pooped on me"
    image = ""
    name = "Tom"

    fill_in :title, with: title
    fill_in :rating, with: rating
    fill_in :content, with: content
    fill_in :image, with: image
    fill_in :name, with: name

    click_on 'Create Review'

    expect(current_path).to eq("/shelters/#{@shelter1.id}")
    expect(page).to have_content("Awful Place")
    expect(page).to have_content(1)
    expect(page).to have_content("A dog pooped on me")
    expect(page).to have_content("Tom")
  end

  it "Will not create a new review without required fields of title, rating, and/or content" do
    visit "/shelters/#{@shelter1.id}/reviews/new"

    title = "Horrific Shelter"
    rating = 1
    content = "Ugliest dogs ever"
    image = ""
    name = "Tom"

    fill_in :title, with: title
    fill_in :rating, with: rating
    # fill_in :content, with: content
    fill_in :image, with: image
    fill_in :name, with: name

    click_on 'Create Review'

    expect(page).to_not have_content("Horrific Shelter")
    expect(current_path).to eq("/shelters/#{@shelter1.id}/reviews")

    expect(page).to have_content("Content can't be blank")
  end
  
  it "Will not create review without a user" do
    visit "/shelters/#{@shelter1.id}/reviews/new"

    title = "Horrific Shelter"
    rating = 1
    content = "Ugliest dogs ever"
    image = ""
    name = "Kevin"

    fill_in :title, with: title
    fill_in :rating, with: rating
    fill_in :content, with: content
    fill_in :image, with: image
    fill_in :name, with: name

    click_on 'Create Review'

    expect(current_path).to eq("/shelters/#{@shelter1.id}/reviews")
    expect(page).to have_content("No user with the name Kevin")
  end
end
