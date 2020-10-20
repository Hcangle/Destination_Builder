Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :destinations
resources :routes, only: [:index, :create, :new, :show, :edit] do 
  resources :directions 
  
end 
root "destinations#index"

get '/destinations/visited', to: 'destinations#visited' 

get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
get '/logout', to: 'sesssions#destroy' 
get 'signup', to: 'users#new'
post '/signup', to: 'users#create'

end
