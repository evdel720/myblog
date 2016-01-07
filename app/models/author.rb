class Author < ActiveRecord::Base
  validates :author, presence: true, uniqueness: true
  has_secure_password
end
