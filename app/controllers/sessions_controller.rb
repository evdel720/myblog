class SessionsController < ApplicationController
  skip_before_action :authorize
  skip_before_action :authorize_author
  
  
  
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    author = Author.find_by(author: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_path, alert: "login as user"
    elsif author && author.authenticate(params[:password])
      session[:author_id] = author.id
      redirect_to posts_path, alert: "login as author"
    else
      redirect_to login_path, alert: "Invalid id and password"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:author_id] = nil
    redirect_to posts_path, notice: "Logged out"
  end
end
