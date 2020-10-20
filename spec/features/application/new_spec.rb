require 'rails_helper'

describe "As a visitor" do
  describe "I can create a new application from the pets index page 'Start an Application' link" do
    before :each do
      @shelter = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
      @user = User.create!(name: "Tom", street_address: "123 Tom ave", city: "Tomville", state: "CO", zip: 80011)
      @pet1 = @shelter.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
      @pet2 = @shelter.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
      @pet3 = @shelter.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
    end
    it "creates a new application for a pet" do
      visit '/pets'

      within "#pet-#{@pet1.id}" do
        click_link "Start an Application"
      end

      expect(current_path).to eq("/pets/#{@pet1.id}/applications/new")

      fill_in :applicant, with: "Tom"
      fill_in :address, with: "123 Tom ave"
      fill_in :description, with: "We feed the pets"

      click_button "Submit"

      expect(current_path).to eq("/applications/#{Application.first.id}")
    end

    it "If user name doesn't match a valid user, return a flash message and redirect back to new page" do
      visit '/pets'

      within "#pet-#{@pet1.id}" do
        click_link "Start an Application"
      end

      expect(current_path).to eq("/pets/#{@pet1.id}/applications/new")

      fill_in :applicant, with: "Tommy"
      fill_in :address, with: "123 Tom ave"
      fill_in :description, with: "We feed the pets"

      click_button "Submit"

      expect(page).to have_content("No user with the name")
      expect(current_path).to eq("/pets/#{@pet1.id}/applications")
    end
  end
end
