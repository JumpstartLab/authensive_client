Rails.application.routes.draw do

  mount AuthensiveClient::Engine => "/authensive_client"
end
