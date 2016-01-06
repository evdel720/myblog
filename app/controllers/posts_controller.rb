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
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: "Post '#{@post.title}' was successfully created." }
      else
        format.html { render :new }
      end
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    
    Comment.all.each do |comment|
      comment.destroy if comment.post_id == @post.id
    end
    
    @post.destroy
    flash.notice = "Post '#{@post.title}' deleted!"
    redirect_to posts_path
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_path, notice: "Post '#{@post.title}' Updated!" }
      else
        format.html { render :edit }
      end
    end
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comment.post_id = @post.id
  end
end
