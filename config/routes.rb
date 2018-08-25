Rails.application.routes.draw do
  get "profiles/search" => "profiles#search"
  post "profiles/search" => "profiles#search"
  resources :profiles
  # get '/profiles/search' => "profiles#search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "profiles#index"
end
