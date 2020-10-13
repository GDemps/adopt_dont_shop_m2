require "rails_helper"

describe "I am taken to a new review path" do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)

    visit "/shelters/#{@shelter1.id}/reviews/new"
    
  end
  it "On this new page, I see a form where I must enter params" do

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
    expect(current_path).to eq("/shelters/#{@shelter1.id}/reviews")

    expect(page).to have_content("Awful Place")
    expect(page).to have_content(1)
    expect(page).to have_content("A dog pooped on me")
    expect(page).to have_content("Tom")
  end
end
