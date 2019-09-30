Rails.application.routes.draw do
  resources :category_events
  resources :categories
  resources :event_attendees
  resources :event_creators
  resources :friendships
  resources :locations
  resources :events
  resources :users
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
