class CategoriesController < ApplicationController
  include CategoriesHelper
  skip_before_action :authorize
  skip_before_action :authorize_author, only: [:show]
  
  def index
    @categories = Category.all
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: "Category '#{@category.name}' successfully created!" }
      else
        format.html { redirect_to categories_path, notice: "Category have to have name." }
      end
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    
    Post.all.each do |post|
      post.destroy if post.category_id == @category.id
    end
    @category.destroy
    flash.notice = "Category '#{@category.name}' deleted!"
    redirect_to categories_path
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_path, notice: "Category '#{@category.name}' Updated!" }
      else
        format.html { render :edit }
      end
    end
  end
  
  def show
    @category = Category.find(params[:id])
  end
end
