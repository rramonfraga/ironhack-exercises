Rails.application.routes.draw do

  get "/contacts" => "contact#index"
  get "/contacts/new" => "contact#new"
  get "/contacts/show/:id" => "contact#show"
  get "/contacts/view-favorites" => "contact#show_favorites"
  post("/contacts", :to => "contact#create")
  post("/favorite", :to => "contact#favorite")
  post("/contacts/search", :to => "contact#search")

end
