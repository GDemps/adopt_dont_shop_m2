require 'rails_helper'

RSpec.describe 'delete shelter' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
  end

  it "can delete a shelter from the shelter show page" do
    visit "/shelters/#{@shelter1.id}"

    expect(page).to have_content(@shelter1.name)

    click_button "Delete Shelter"

    expect(current_path).to eq("/shelters")

    expect(page).to_not have_content(@shelter1.name)
    expect(page).to have_content(@shelter2.name)
  end
end
