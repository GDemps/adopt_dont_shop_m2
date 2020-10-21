# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#shelters
ApplicationPet.delete_all
Application.delete_all
Review.delete_all
Pet.delete_all
Shelter.delete_all
User.delete_all

@shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)

@shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)

#users
@user_1 = User.create!(name: "Tom", street_address: "123 Tom ave", city: "Tomville", state: "CO", zip: 80011)

#reviews
@review_1 = @user_1.reviews.create!(title: "Great Ptes", rating: 4, content: "We got a dog", image:"", name: @user_1.name, shelter_id: @shelter1.id)

#pets
@pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")

@pet2 = @shelter2.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")

@pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")

@pet4 = @shelter1.pets.create!(image:"", name: "Chronos", description: "dog", approximate_age: 10000, sex: "male")

@application1 = @user_1.applications.create(applicant: @user_1.name, address: @user_1.street_address, description: "We have pet snacks", application_status: "Pending")

ApplicationPet.create(application_id: @application1.id, pet_id: @pet1.id)
