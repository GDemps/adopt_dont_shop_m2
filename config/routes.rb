Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "welcome#index"

  get "/shelters", to: "shelters#index"
  get "/shelters/new", to: "shelters#new"
  get "/shelters/:id", to: "shelters#show"
  delete "/shelters/:id", to: "shelters#destroy"
  post "/shelters", to: "shelters#create"
  get "/shelters/:id/edit", to: "shelters#edit"
  patch "/shelters/:id", to: "shelters#update"

  get "/pets", to: "pets#index"
  get "/pets/:id", to: "pets#show"
  get "/pets/:id/edit", to: "pets#edit"
  patch "/pets/:id", to: "pets#update"
  delete "/pets/:id", to: "pets#destroy"

  get "/shelters/:shelter_id/pets", to: "shelter_pets#index"
  get "/shelters/:shelter_id/pets/new", to: "shelter_pets#new"
  post "/shelters/:shelter_id/pets", to: "shelter_pets#create"
  get "/shelters/:id/pets/:id", to: "pets#show"

  get "/users/new", to: "users#new"
  post "/users/:id", to: "users#create"
  get "/users/:id", to: "users#show"

  get '/shelters/:shelter_id/reviews/new', to: 'reviews#new'
  post '/shelters/:shelter_id/reviews', to: 'reviews#create'
  get '/reviews/:id/edit', to: "reviews#edit"
  patch '/reviews/:id', to: "reviews#update"
  delete '/reviews/:id/delete', to: 'reviews#destroy'

  get 'pets/:id/applications/new', to: 'applications#new'
  post '/pets/:id/applications', to: 'applications#create'
  post 'pets/:pet_id/applications/:application_id', to: 'applications#add_to_application'
  patch '/applications/:application_id', to: 'applications#update'
  get '/applications/:id', to: 'applications#show'
end
