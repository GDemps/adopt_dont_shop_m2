Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/shelters", to: "shelters#index"
  get "/shelters/new", to: "shelters#new"
  get "/shelters/:id", to: "shelters#show"
  delete "/shelters/:id", to: "shelters#destroy"
  post "/shelters", to: "shelters#create"
  get "/shelters/:id/edit", to: "shelters#edit"
  patch "/shelters/:id", to: "shelters#update"

  get "/pets", to: "pets#index"
  get "/pets/:id", to: "pets#show"

  get "/shelters/:id/pets", to: "shelter_pets#index"
end
