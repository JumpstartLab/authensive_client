module AuthensiveClient
  module ApplicationHelper
    def current_user
      @current_user ||= ( session[:user] ? JSON.parse(session['user']) : false )
    end
  end
end
