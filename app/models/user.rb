class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_secure_password
  validates :email, presence: true
  validates :follow, inclusion: [true, false]
end
