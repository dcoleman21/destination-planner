Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'destinations#index'
  resources :destinations
  namespace :api do
    namespace :v1 do
      resources :destinations
      get '/destination-weather/:id', to: "destination_weather#show"
      # only: [:index, :show, :create, :update, :destroy]
    end
  end
end
