require "rails_helper"

describe "When I click on the Delete Review link from a shelter's show page" do
  describe "I am returned to that shelters page and I no longer see that review" do
    before :each do
      @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
      @user_1 = User.create!(name: "Tom", street_address: "123 Tom ave", city: "Tomville", state: "CO", zip: 80011)
      @review_1 = @user_1.reviews.create!(title: "Great Pets", rating: 4, content: "We got a dog", image:"", name: @user_1.name, shelter_id: @shelter1.id)
    end
    it "deletes a review from A shelters show page" do
      visit "/shelters/#{@shelter1.id}"

      within "#review-#{@review_1.id}" do
        expect(page).to have_link("Delete Review")
        click_link("Delete Review")
      end

      expect(current_path).to eq("/shelters/#{@shelter1.id}")
      expect(page).to_not have_content(@review_1)
    end
  end
end
