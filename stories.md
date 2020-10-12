## User Stories

```
[ ] done

User Story 1, Deploy your application to Heroku

As a visitor or user of the site
I will perform all user stories
By visiting the application on Heroku.
Localhost is fine for development, but
the application must be hosted on Heroku.
```

## Users

Our Application is going to need to track who is using it. To that end, we are going to create a `users` table. A User should have a name, street address, city, state, and zip.

In a fully functioning web application, users would normally need to log in with a password in order to do anything associated with that user's account. However, in this project we will not be adding any log in functionality.

Also notice that all User stories start with "As a visitor". A "visitor" is someone who is not logged into a user account. Since we are not adding any log in functionality, anyone using our application is considered a "visitor".

```
User Story 2, User Show Page

As a visitor
When I visit a User's show page
Then I see all that User's information
Including the User's
  - Name
  - Street Address
  - City
  - State
  - Zip
```

```
User Story 3, New User

As a visitor
When I visit '/users/new'
I see a form to create a new user
When I fill in the form with my
  - Name
  - Street Address
  - City
  - State
  - Zip
Then I am taken to my new user's show page
And I see all of the information I entered in the form
```


## Shelter Reviews

Users will be able to share their experiences with a shelter through providing reviews. Users should be able to create a review with a title (Example: "Awesome place!"), a rating (out of 5), and content (Example: "Truly enjoyed our time working with this shelter. Staff was great, and we found our perfect pet!"). A user can also upload one picture (image url address) for their review as well, but this is optional.

A review should belong to a Shelter, and belong to a User.

```
[ ] done

User Story 4, Shelter Reviews

As a visitor,
When I visit a shelter's show page,
I see a list of reviews for that shelter
Each review will have:
- title
- rating
- content
- an optional picture
- the name of the user that wrote the review
```

```
[ ] done

User Story 5, Shelter Review Creation

As a visitor,
When I visit a shelter's show page
I see a link to add a new review for this shelter.
When I click on this link, I am taken to a new review path
On this new page, I see a form where I must enter:
- title
- rating
- content
- the name of a user that exists in the database
I also see a field where I can enter an optional image (web address)
When the form is submitted, I should return to that shelter's show page
and I can see my new review
```

```
[ ] done

User Story 6, User Reviews

As a visitor
When I visit a User's show page
Then I see every review this User has written
Including the review's title, rating, and content
```


```
[ ] done

User Story 7, Edit a Shelter Review

As a visitor,
When I visit a shelter's show page
I see a link to edit the shelter review next to each review.
When I click on this link, I am taken to an edit shelter review path
On this new page, I see a form that includes that review's pre populated data:
- title
- rating
- content
- image
- the name of the user that wrote the review
I can update any of these fields and submit the form.
When the form is submitted, I should return to that shelter's show page
And I can see my updated review
```

```
[ ] done

User Story 8, Delete a Shelter Review

As a visitor,
When I visit a shelter's show page,
Then I see a link next to each shelter review to delete the review.
When I click this link
Then I am returned to the shelter's show page
And I no longer see that shelter review
```


```
[ ] done

User Story 9, Shelter Review Creation, Incomplete Form

As a visitor,
When I visit the new review page
And I fail to enter a title, a rating, and/or content in the new shelter review form, but still try to submit the form
I see a flash message indicating that I need to fill in a title, rating, and content in order to submit a shelter review
And I'm returned to the new form to create a new review
```

```
[ ] done

User Story 10, Shelter Review Creation, User not Found

As a visitor,
When I visit the new review page
And I enter the name of a User that doesn't exist in the database, but still try to submit the form
I see a flash message indicating that the User couldn't be found
And I'm returned to the new form to create a new review
```

```
[ ] done

User Story 11, Edit a Shelter Review, Incomplete Form

As a visitor,
When I visit the page to edit a review
And I fail to enter a title, a rating, and/or content in the edit shelter review form, but still try to submit the form
I see a flash message indicating that I need to fill in a title, rating, and content in order to edit a shelter review
And I'm returned to the edit form to edit that review
```

```
[ ] done

User Story 12, Edit Shelter Review, User Not Found

As a visitor,
When I visit the page to edit a review
And I enter the name of a User that doesn't exist in the database, but still try to submit the form
I see a flash message indicating that the User couldn't be found
And I'm returned to the new form to create a new review
```

## User Review Statistics

```
[ ] done

User Story 13, User Review Average Rating

As a visitor
When I visit a User's show page
Then I see the average rating of all of their reviews
```

```
[ ] done

User Story 14, Highlighted User Reviews

As a visitor
When I visit a User's show page
Then I see a section for "Highlighted Reviews"
And I see the review with the best rating that this user has written
And I see the review with the worst rating that this user has written
```


## Apply for Pet(s)

Users will be able to submit an application for one or more pets.

```
[ ] done

User Story 15, Application Show Page

PAIR STORY: It is recommended that you work on this story as a pair. Both partners should understand the data model for applications and how they relate to other models.

As a visitor
When I visit an applications show page "/applications/:id"
Then I can see the following:
- Name of the User on the Application
- Full Address of the User on the Application
- Description of why the applicant says they'd be a good home for this pet(s)
- names of all pets that this application is for (all names of pets should be links to their show page)
- The Application's status, either "In Progress", "Pending", "Accepted", or "Rejected"
```

```
[ ] done

User Story 16, Starting an Application

As a visitor
When I visit the pet index page
Then I see a link to "Start an Application"
When I click this link
Then I am taken to the new application page where I see a form
When I fill in this form with my user name (assuming I have already created a user in the system)
And I click submit
Then I am taken to the new application's show page
And I see my user listed along with all of my address information
And I see an indicator that this application is "In Progress"
```

```
[ ] done

User Story 17, Starting an Application, User not found

As a visitor
When I visit the new application page
And I fill in the form with the name of a User that doesn't exist in the database
And I click submit
Then I am taken back to the new applications page
And I see a message that the user could not be found.
```

```
[ ] done

User Story 18, Searching for Pets for an Application

As a visitor
When I visit an application's show page
And that application has not been submitted,
Then I see a section on the page to "Add a Pet to this Application"
In that section I see an input where I can search for Pets by name
When I fill in this field with a Pet's name
And I click submit,
Then I am taken back to the application show page
And under the search bar I see any Pet whose name matches my search
```

```
[ ] done

User Story 19, Add a Pet to an Application

As a visitor
When I visit an application's show page
And I search for a Pet by name
And I see the names Pets that matches my search
Then next to each Pet's name I see a button to "Adopt this Pet"
When I click one of these buttons
Then I am taken back to the application show page
And I see the Pet I want to adopt listed on this application
```

```
[ ] done

User Story 20, Submit an Application

As a visitor
When I visit an application's show page
And I have added one or more pets to the application
Then I see a section to submit my application
And in that section I see an input to enter why I would make a good owner for these pet(s)
When I fill in that input
And I click a button to submit this application
Then I am taken back to the application's show page
And I see an indicator that the application is "Pending"
And I see all the pets that I want to adopt
And I do not see a section to add more pets to this application
```

```
[ ] done

User Story 21, No Pets on an Application

As a visitor
When I visit an application's show page
And I have not added any pets to the application
Then I do not see a section to submit my application
```


```
[ ] done

User Story 22, Incomplete application for Pets

As a visitor
When I visit an application's show page
And I have added one or more pets to the application
And I fail to enter why I would make a good owner for these pet(s)
Then I am taken back to the application's show page
And I see a flash message that I need to fill out that field before I can submit the application
And I see my application is still "In Progress"
```

```
[ ] done

User Story 23, Partial Matches for Pet Names

As a visitor
When visit an application show page
And I search for Pets by name
Then I see any pet whose name PARTIALLY matches my search
For example, if I search for "fluff", my search would match pets with names "fluffy", "fluff", and "mr. fluff"
```

```
[ ] done

User Story 24, Case Insensitive Matches for Pet Names

As a visitor
When visit an application show page
And I search for Pets by name
Then my search is case insensitive
For example, if I search for "fluff", my search would match pets with names "Fluffy", "FLUFF", and "Mr. FlUfF"
```

## Approving Applications

Pets on an application can either be accepted or rejected. Once all pets on an application have been marked either accepted or rejected, then the application is no longer "Pending". If all the pets were accepted, then the application is accepted. If one or more pets on the application is rejected, then the entire application is rejected.

For this set of stories, we will be making routes that begin with '/admin'. This is to indicate that only a user with special privileges should be able to accept or reject pets on an application. Normally, we would want to make sure that a user is logged into an admin account before being able complete any of this workflow, but we will not add any log in or authorization functionality to this project.

```
[ ] done

User Story 25, Approving a Pet for Adoption

As a visitor
When I visit an admin application show page ('/admin/applications/:id')
For every pet that the application is for, I see a button to approve the application for that specific pet
When I click that button
Then I'm taken back to the admin application show page
And next to the pet that I approved, I do not see a button to approve this pet
And instead I see an indicator next to the pet that they have been approved
```

```
[ ] done

User Story 26, Rejecting a Pet for Adoption

As a visitor
When I visit an admin application show page ('/admin/applications/:id')
For every pet that the application is for, I see a button to reject the application for that specific pet
When I click that button
Then I'm taken back to the admin application show page
And next to the pet that I rejected, I do not see a button to approve or reject this pet
And instead I see an indicator next to the pet that they have been rejected
```

```
[ ] done

User Story 27, All Pets Accepted on an Application

As a visitor
When I visit an admin application show page
And I approve all pets for an application
Then I am taken back to the admin application show page
And I see the application's status has changed to "Approved"
```

```
[ ] done

User Story 28, One or More Pets Rejected on an Application

As a visitor
When I visit an admin application show page
And I reject one or more pets for the application
And I approve all other pets on the application
Then I am taken back to the admin application show page
And I see the application's status has changed to "Rejected"
```


```
User Story 29, Pets can only have one approved application on them at any time

[ ] done

As a visitor
When a pet has an "Approved" application on them
And when I the pet has a "Pending" application on them
And I visit the admin application show page for pending application
Then next to the pet I do not see a button to approve or reject them
And instead I see a message that this pet has been approved for adoption
```

## Viewing Applications

```
[ ] done

User Story 30, Pet Applications Index Page

As a visitor
When I visit a pets show page
I see a link to view all applications for this pet
When I click that link
I can see a list of all the names of applicants for this pet
Each applicants name is a link to the application's show page
```


```
[ ] done

User Story 31, Pet Applications Index Page When No Applications

As a visitor
When I visit a pet applications index page for a pet that has no applications on them
I see a message saying that there are no applications for this pet yet
```

## Shelters
Visitors will have additional constraints when manipulating shelter data in the database.

```
[ ] done

User Story 32, Shelter Statistics

As a visitor
When I visit a shelter's show page
I see statistics for that shelter, including:
- count of pets that are at that shelter
- average shelter review rating
- number of applications on file for that shelter
```


```
[ ] done

User Story 33, Shelters with Pets that have pending status cannot be Deleted

As a visitor
If a shelter has approved applications for any of their pets
I can not delete that shelter
Either:
- there is no button visible for me to delete the shelter
- if I click on the delete link for deleting a shelter, I see a flash message indicating that the shelter can not be deleted.
```

```
[ ] done

User Story 34, Shelters can be Deleted as long as all pets do not have approved applications on them

As a visitor
If a shelter doesn't have any pets with an approved application
I can delete that shelter
When that shelter is deleted
Then all of their pets are deleted as well
```

```
[ ] done

User Story 35, Deleting Shelters Deletes its Reviews

As a visitor
When I delete a shelter
All reviews associated with that shelter are also deleted
```

## Pets

```
[ ] done

User Story 36, Pets with approved applications cannot be deleted

As a visitor
If a pet has an approved application on them
I can not delete that pet
Either:
- there is no button visible for me to delete the pet
- if I click on the delete button, I see a flash message indicating that the pet can not be deleted.
```

## Extensions

```
User Story 37, List of Pets with Approved Applications

[ ] done

As a visitor
After an application has been approved for one or more pets
When I visit the favorites page
I see a section on the page that has a list of all of the pets that have an approved application on them
Each pet's name is a link to their show page
```

```
[ ] done

User Story 38, Reviews have a default picture

As a visitor
When I create a review for a shelter
And do not fill in the field for an image
A default image is used and displayed for that review upon submission
```

```
[ ] done

User Story 39, Sortable Reviews

As a visitor,
When I visit a shelter's show page to see their reviews,
I see additional links to sort their reviews in the following ways:
- sort reviews by highest rating, then by descending date
- sort reviews by lowest rating, then by ascending date
```

```
[ ] done

User Story 40, More Shelter Statistics

As a visitor,
When I visit the shelter's index page
I see the top 3 highest rated shelters highlighted on a specific part of the page
```
