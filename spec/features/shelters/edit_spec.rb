require 'rails_helper'

RSpec.describe 'Shelter update from show page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
  end

  it "can update a shelter from the shelter show page" do
    visit "/shelters/#{@shelter1.id}"

    click_link "Edit Shelter"

    expect(current_path).to eq("/shelters/#{@shelter1.id}/edit")

    fill_in "name", with: 'Poo and Paws'
    # fill_in "address", with: 'street avenue'
    # fill_in "city", with: 'Pitt'
    # fill_in "state", with: 'PA'
    # fill_in "zip", with: 12345

    click_button("Update Shelter")

    expect(current_path).to eq("/shelters/#{@shelter1.id}")

    expect(page).to have_content("Poo and Paws")
    expect(page).to_not have_content("Shady Shelter")
  end
end
