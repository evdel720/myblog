class PostsController < ApplicationController
  include PostsHelper
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.save
    flash.notice = "Post '#{@post.title}' successfully created!"
    redirect_to posts_path
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash.notice = "Post '#{@post.title}' deleted!"
    redirect_to posts_path
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    flash.notice = "Post '#{@post.title}' Updated!"
    redirect_to posts_path
  end
  
  def show
    @post = Post.find(params[:id])
  end
end
