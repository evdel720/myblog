class Post < ActiveRecord::Base
  belongs_to :category
  #has_many :comments
  validates :title, :body, presence: true
end
