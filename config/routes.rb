Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :destinations, only: :index
resources :routes, only: [:index, :create, :new] do 
  resources :directions, only: [:index, :new]
end 
resources :directions, only: :create 
end
