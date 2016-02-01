class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  validates_presence_of :title, :body
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ?", "%#{query}%")
  end
end
