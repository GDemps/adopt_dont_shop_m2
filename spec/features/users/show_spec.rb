require "rails_helper"

describe "As a visitor" do
  describe "When I visit a User's show page " do
    before :each do
      @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
      @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
      @user_1 = User.create!(name: "Tom", street_address: "123 Tom ave", city: "Tomville", state: "CO", zip: 80011)
      @review_1 = @user_1.reviews.create!(title: "Great Pets", rating: 4, content: "We got a dog", image:"", name: @user_1.name, shelter_id: @shelter1.id)
      @review_2 = @user_1.reviews.create!(title: "Uncool cats", rating: 1, content: "We got a dog", image:"", name: @user_1.name, shelter_id: @shelter2.id)
    end
    it "Then I see all that User's information" do
      visit "/users/#{@user_1.id}"

      expect(page).to have_content(@user_1.name)
      expect(page).to have_content(@user_1.street_address)
      expect(page).to have_content(@user_1.city)
      expect(page).to have_content(@user_1.state)
      expect(page).to have_content(@user_1.zip)
    end

    it "displays every review this User w/ title and rating" do
      visit "/users/#{@user_1.id}"

      expect(page).to have_content(@review_1.title)
      expect(page).to have_content(@review_1.rating)
      expect(page).to have_content(@review_2.title)
      expect(page).to have_content(@review_2.rating)
    end

    it "displays best and worst rated reviews by that user" do
      visit "/users/#{@user_1.id}"

      within "#highlighted_best" do
        expect(page).to have_content(@review_1.title)
        expect(page).to have_content(@review_1.rating)
        expect(page).to have_content(@review_1.content)
      end

      within "#highlighted_worst" do
        expect(page).to have_content(@review_2.title)
        expect(page).to have_content(@review_2.rating)
        expect(page).to have_content(@review_2.content)
      end
    end
  end
end
