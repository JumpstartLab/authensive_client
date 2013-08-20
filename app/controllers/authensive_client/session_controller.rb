module AuthensiveClient
  class SessionController < ApplicationController
    def login
      if User.validate_user_id?(params[:user_id], params[:authensive_signiture])
        session[:user_id] = params[:user_id]
        session[:authensive_signiture] = params[:authensive_signiture]
        session[:user] = User.fetch(params[:user_id]).to_json
        redirect_to params[:return_to]
      else
        raise ArgumentError.new("Signature match failed")
        redirect_to root_path
      end
    end

    def logout
      session[:user_id] = nil
      redirect_to main_app.root_path
    end
  end
end