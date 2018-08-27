Rails.application.routes.draw do

  root :to => "profiles#index"


  get "profiles/events/:id/addnewtoevent" => "events#addnewtoevent"
  post "profiles/events/:id/addnewtoevent" => "events#addnewtoevent"
  post "profiles/events/:id/addnewtoeventprocess/:profileid" => "events#addnewtoeventprocess"
  post "profiles/events/:id/deletenewfromeventprocess/:profileid" => "events#deletenewfromeventprocess"
  resources :events, path: '/profiles/events'

  get "profiles/search" => "profiles#search"
  post "profiles/search" => "profiles#search"
  get "profiles/importance" => "profiles#importance"
  post "profiles/importance" => "profiles#importance"
  post "profiles/:id" => "profiles#show"
  delete "profiles/importance/:id" => "profiles#delete_importance"
  resources :profiles

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
