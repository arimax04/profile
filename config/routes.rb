Rails.application.routes.draw do

  root :to => "profiles#index"

  # get "profiles/events" => "events#index"
  # post "profiles/events" => "events#create"
  # post "profiles/events/:id" => "events#update"
  # put "profiles/events/:id" => "events#update"
  # patch "profiles/events/:id" => "events#update"
  # delete "profiles/events/:id" => "events#destroy"
  #
  # get "profiles/events/new" => "events#new"
  #
  # get "profiles/events/show/:id" => "events#show"
  #
  # get "profiles/events/:id/edit" => "events#edit"
  resources :events, path: '/profiles/events'

  get "profiles/search" => "profiles#search"
  post "profiles/search" => "profiles#search"
  get "profiles/importance" => "profiles#importance"
  post "profiles/importance" => "profiles#importance"
  get "profiles/eventlist" => "profiles#showevents"
  post "profiles/:id" => "profiles#show"
  delete "profiles/importance/:id" => "profiles#delete_importance"
  resources :profiles

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
