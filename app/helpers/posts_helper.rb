module PostsHelper
  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
