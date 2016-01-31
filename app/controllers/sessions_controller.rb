class SessionsController < ApplicationController
  skip_before_action :authorize
  skip_before_action :authorize_author

  def new
    redirect_to posts_path, alert: "Please logout first" if session[:user_id] || session[:author_id]
  end

  def create
    user = User.find_by(name: params[:name])
    author = Author.find_by(author: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_path
    elsif author && author.authenticate(params[:password])
      session[:author_id] = author.id
      redirect_to posts_path
    else
      if !user && !author
        redirect_to login_path
      else
        redirect_to login_path, alert: "Invalid id and password"
      end
    end
  end

  def destroy
    session[:user_id] = nil
    session[:author_id] = nil
    redirect_to posts_path
  end
end
