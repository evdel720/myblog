class CategoriesController < ApplicationController
  include CategoriesHelper
  def index
    @categories = Category.all
    @category = Category.new
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    @category.save
    flash.notice = "Category '#{@category.name}' successfully created!"
    redirect_to categories_path
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
    @category.update(category_params)
    flash.notice = "Category '#{@category.name}' Updated!"
    redirect_to categories_path
  end
  
  def show
    @category = Category.find(params[:id])
  end
end
