Rails.application.routes.draw do
  get "/" => 'site#home'
  get "/contact" => 'site#contact'

  resources :projects, only: [:index, :show] do
    resources :entries, only: [:index, :new, :create]
  end
end
