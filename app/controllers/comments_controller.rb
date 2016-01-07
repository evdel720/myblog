class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
  
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@comment.post), notice: "Your comment is successfully saved!" }
      else
        format.html { redirect_to post_path(@comment.post), notice: "Comment should have your name, comment and password." }
      end
    end
  end
  
  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_path(@comment.post_id), notice: "Your comment is Updated!" }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash.notice = "Your comment is deleted!"
    redirect_to post_path(@post)
  end
  
  def comment_params
    params.require(:comment).permit(:body)
  end
  
end
