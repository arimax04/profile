Rails.application.routes.draw do
  root :to => "profiles#index"

  # scope :profiles do
  resources :events do
    collection do
      post "selectevent",action:"selectevent"
    end

    member do
      get "addnewtoevent" => "events#addnewtoevent"
      post "addnewtoevent" => "events#addnewtoevent"
      post "addnewtoeventprocess/:profileid" => "events#addnewtoeventprocess", as:"addnewtoeventprocess"
      post "deletenewfromeventprocess/:profileid" => "events#deletenewfromeventprocess", as:"deletenewfromeventprocess"
    end
  end
  # end

  resources :profiles do
    collection do
      get "login", action:"login"
      post "login", action:"postlogin"
      delete "login", action:"logout"
      post "select", action:"settopparam"
      get "search", action:"search"
      post "search", action:"search"
      get "importance", action:"importance"

    end
    member do
      post "importance", action:"postimportance"
      delete "importance", action:"delete_importance"
    end

  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
