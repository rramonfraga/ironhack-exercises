Rails.application.routes.draw do
  get "/" => "site#home"

  resources :users, only: [:show, :new, :index, :create, :destroy] do
    resources :products, only: [:index, :show, :new, :create, :destroy] do
      resources :bids, only: [:create]
    end
  end
end
