module AuthensiveClient
  module ApplicationHelper
  end
end

module ApplicationHelper
  def current_user
    #session[:user_id] ? User.from_session(session) : false
    @current_user ||= ( session[:user] ? JSON.parse(session[:user]) : false )
  end
end
