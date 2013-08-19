AuthensiveClient::Engine.routes.draw do  
  get "/login", :to => 'session#login', :as => 'login'
  get "/logout", :to => 'session#logout', :as => 'logout'
end
