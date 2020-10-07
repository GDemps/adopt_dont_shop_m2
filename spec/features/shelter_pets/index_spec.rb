require 'rails_helper'

RSpec.describe 'Shelter_Pets index page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
    @shelter3 = Shelter.create!(name: "Shell Shelter", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
    @pet1 = @shelter1.pets.create!(image:"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=1.00xw:0.669xh;0,0.190xh&resize=1200:*", name: "Thor", approximate_age: 2, sex: "male")
    @pet2 = @shelter2.pets.create!(image:"", name: "Athena", approximate_age: 3, sex: "female")
    @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", approximate_age: 4, sex: "male")
  end

  it "displays each pet that can be adopted from that shelter including pet attributes" do

    visit "/shelters/#{@shelter1.id}/pets"

    expect(page).to have_content(@pet1.image)
    expect(page).to have_content(@pet1.name)
    expect(page).to have_content(@pet1.approximate_age)
    expect(page).to have_content(@pet1.sex)

    expect(page).to have_content(@pet3.image)
    expect(page).to have_content(@pet3.name)
    expect(page).to have_content(@pet3.approximate_age)
    expect(page).to have_content(@pet3.sex)

    expect(page).to_not have_content(@pet2.name)
  end
end
