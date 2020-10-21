require 'rails_helper'

describe "As a visitor" do
  describe "When I visit /application/:id" do
    before :each do
      @shelter = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
      @user = User.create!(name: "Tom", street_address: "123 Tom ave", city: "Tomville", state: "CO", zip: 80011)
      @pet1 = @shelter.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
      @pet2 = @shelter.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
      @pet3 = @shelter.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")

      @application = @user.applications.create(applicant: @user.name, address: @user.street_address, description: "We have pet snacks", application_status: "In Progress")

      ApplicationPet.create(application_id: @application.id, pet_id: @pet1.id)
      ApplicationPet.create(application_id: @application.id, pet_id: @pet2.id)
      ApplicationPet.create(application_id: @application.id, pet_id: @pet3.id)
    end
    it "Has a User's name, address, reason to adopt (description), all pets to adopted and status." do
      visit "/applications/#{@application.id}"

      expect(page).to have_content(@application.applicant)
      expect(page).to have_content(@application.address)
      expect(page).to have_content(@application.description)

      expect(page).to have_content(@application.application_status)
      expect(page).to have_content(@application.application_status)

      within "#pet-link-#{@pet1.id}" do
        expect(page).to have_link(@pet1.name, :href=>"/pets/#{@pet1.id}")
      end
      within "#pet-link-#{@pet2.id}" do
        expect(page).to have_link(@pet2.name, :href=>"/pets/#{@pet2.id}")
      end
      within "#pet-link-#{@pet3.id}" do
        expect(page).to have_link(@pet3.name, :href=>"/pets/#{@pet3.id}")
      end
    end
    it "Search for a pet and add it to your application" do
      visit "/applications/#{@application.id}"

      @pet4 = @shelter.pets.create!(image:"", name: "Chronos", description: "dog", approximate_age: 10000, sex: "male")

      fill_in :search, with: "Chronos"
      click_on "Submit"

      within "#pet-search" do
        expect(page).to have_content(@pet4.name)
        expect(page).to have_link(@pet4.name)
      end
    end
    it "Adopt a pet from the search results" do
      visit "/applications/#{@application.id}"

      @pet4 = @shelter.pets.create!(image:"", name: "Chronos", description: "dog", approximate_age: 10000, sex: "male")

      fill_in :search, with: "Chronos"
      click_on "Submit"

      within "#pet-search" do
        expect(page).to have_content(@pet4.name)
        expect(page).to have_link(@pet4.name)
        expect(page).to have_button("Adopt")
        click_button "Adopt"
      end

      within "#pet-link-#{@pet4.id}" do
        expect(page).to have_content(@pet4.name)
      end
    end
    it "Has a section to submit Application" do
      visit "/applications/#{@application.id}"

      @pet4 = @shelter.pets.create!(image:"", name: "Chronos", description: "dog", approximate_age: 10000, sex: "male")

      within "#pet-search" do
        fill_in :search, with: "Chronos"
        click_on "Submit"
      end

      within "#app-submission" do
        expect(page).to have_button("Submit Application")
        click_button "Submit Application"
      end

      within '#pet-search' do
        expect(page).to_not have_button("Search")
      end

      expect(page).to have_content("Pending")
    end
  end
end
