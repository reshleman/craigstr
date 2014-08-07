class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  has_many :posts

  def can_edit?(post)
    email == post.user.email || admin?
  end
end
