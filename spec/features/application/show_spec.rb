require 'rails_helper'

describe "As a visitor" do
  describe "When I visit /application/:id" do
    before :each do
      @shelter = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
      @user = User.create!(name: "Tom", street_address: "123 Tom ave", city: "Tomville", state: "CO", zip: 80011)
      @pet1 = @shelter.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
      @pet2 = @shelter.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
      @pet3 = @shelter.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")

      @application = @user.applications.create(applicant: @user.name, address: @user.street_address, description: "We have pet snacks", application_status: "Pending")

      ApplicationPet.create(application_id: @application.id, pet_id: @pet1.id)
      ApplicationPet.create(application_id: @application.id, pet_id: @pet2.id)
      ApplicationPet.create(application_id: @application.id, pet_id: @pet3.id)
    end
    it "Has a User's name, address, reason to adopt (description), all pets to adopted and status." do
      visit "/application/#{@application.id}"

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
  end
end
