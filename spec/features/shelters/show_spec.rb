require 'rails_helper'

RSpec.describe 'Shelter show page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
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

  end
end
