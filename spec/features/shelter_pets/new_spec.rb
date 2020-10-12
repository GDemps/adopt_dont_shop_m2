require 'rails_helper'

RSpec.describe 'From shelter pets index page create new pet' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
    @shelter3 = Shelter.create!(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
  end

  it "can create a new pet from Shelter Pet index page" do

    visit "/shelters/#{@shelter1.id}/pets"

    click_link "Add Pet"

    expect(current_path).to eq("/shelters/#{@shelter1.id}/pets/new")

    fill_in "image", with: ""
    fill_in "name", with: 'Apollo'
    fill_in "description", with: 'Dog'
    fill_in "approximate_age", with: 3
    fill_in "sex", with: "male"

    click_on 'Create Pet'

    expect(current_path).to eq("/shelters/#{@shelter1.id}/pets")

    expect(page).to have_content("")
    expect(page).to have_content("Apollo")
    expect(page).to have_content(3)
    expect(page).to have_content("male")
  end
end
