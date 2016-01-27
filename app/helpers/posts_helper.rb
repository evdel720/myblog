module PostsHelper
  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end

def date_format(date)
    "#{date.year}.#{date.month}.#{date.day}  #{date.hour}:#{date.min}"
  end