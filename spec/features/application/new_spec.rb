require 'rails_helper'

describe "As a visitor" do
  describe "When I visit /application/:id" do
    before :each do
      @shelter = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
      @user = User.create!(name: "Tom", street_address: "123 Tom ave", city: "Tomville", state: "CO", zip: 80011)
      @pet1 = @shelter.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
      @pet2 = @shelter.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
      @pet3 = @shelter.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")

      @application = @user.applications.create(applicant: @user.name, address: @user.street_address, description: "We have pet snacks", app_pets: [@pet1.name, @pet2.name, @pet3.name], application_status: "Pending")
    end
    it "Has a User's name, address, reason to adopt (description), all pets to adopted and status." do
      visit "/application/#{@application.id}"

      expect(page).to have_content(@application.applicant)
      expect(page).to have_content(@application.address)
      expect(page).to have_content(@application.descrition)
      expect(page).to have_content(@application.app_pets)
      expect(page).to have_content(@application.application_status)
    end
  end
end
