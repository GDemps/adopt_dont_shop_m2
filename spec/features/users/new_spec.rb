require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When visiting /user/new" do
    it "I see a form to create new user" do
      visit "/users/new"

      fill_in :name, with: "Phil"
      fill_in :street_address, with: "123 Phil Dr."
      fill_in :city, with: "Philville"
      fill_in :state, with: "CO"
      fill_in :zip, with: 12345

      click_on "Create User"

      require "pry"
      binding.pry

      expect(current_path).to eq("/users/#{User.last.id}")
      expect(page).to have_content("Phil")
      expect(page).to have_content("123 Phil Dr.")
      expect(page).to have_content("Philville")
      expect(page).to have_content("CO")
      expect(page).to have_content(12345)
    end
  end
end
