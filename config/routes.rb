Rails.application.routes.draw do

  root :to => "profiles#index"

  get "profiles/event" => "event#index"
  get "profiles/event/new" => "event#new"
  get "profiles/event/show/:id" => "event#show"
  get "profiles/event/:id/edit" => "event#edit"
  post "profiles/event" => "event#create"
  delete "profiles/event/:id" => "event#destroy"

  get "profiles/search" => "profiles#search"
  post "profiles/search" => "profiles#search"
  get "profiles/importance" => "profiles#importance"
  post "profiles/importance" => "profiles#importance"
  post "profiles/:id" => "profiles#show"
  delete "profiles/importance/:id" => "profiles#delete_importance"
  resources :profiles

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
