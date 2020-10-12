require "rails_helper"

describe "As a visitor" do
  describe "When I visit a User's show page " do
    before :each do
      @user_1 = User.create!(name: "Tom", street_address: "123 Tom ave", city: "Tomville", state: "CO", zip: 80011)
    end
    it "Then I see all that User's information" do
      visit "/users/#{@user_1.id}"

      expect(page).to have_content(@user_1.name)
      expect(page).to have_content(@user_1.street_address)
      expect(page).to have_content(@user_1.city)
      expect(page).to have_content(@user_1.state)
      expect(page).to have_content(@user_1.zip)
    end
  end
end
