require 'rails_helper'

RSpec.describe 'Update pet from pet show page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
    @shelter3 = Shelter.create!(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
  end

  it "can update a shelter from the shelter show page" do
    visit "/pets/#{@pet1.id}"

    click_link "Update Pet"

    expect(current_path).to eq("/pets/#{@pet1.id}/edit")

    fill_in "name", with: "Thora"
    fill_in "approximate_age", with: 5
    fill_in "sex", with: "female"
    # fill_in "state", with: 'PA'
    # fill_in "zip", with: 12345

    click_button("Update")

    expect(current_path).to eq("/pets/#{@pet1.id}")

    expect(page).to have_content("Name: Thora")
    expect(page).to have_content("Approx Age: 5")
    expect(page).to_not have_content("Approx Age: 2")
    expect(page).to have_content("Sex: female")
    expect(page).to_not have_content("Sex: male")
  end
end
