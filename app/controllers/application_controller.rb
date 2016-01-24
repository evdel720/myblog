class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize
  before_action :authorize_author
  
  protected
    def authorize
      if session[:user_id] == nil and session[:author_id] == nil
        redirect_to login_path, alert: "Please log in"
      end
    end
    
    def authorize_author
      if session[:author_id] == nil
        redirect_to login_path, alert: "Please log in as author for this"
      end
    end
end
