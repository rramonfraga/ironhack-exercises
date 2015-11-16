Rails.application.routes.draw do

  get "/contacts" => "contact#index"
  get "/contacts/new" => "contact#new"
  get "/contacts/show/:id" => "contact#show"
  post("/contacts", :to => "contact#create")
  post("/favorite", :to => "contact#favorite")

end
