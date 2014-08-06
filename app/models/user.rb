class User < ActiveRecord::Base
  has_many :posts
  has_many :spam_flags

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def flag(post)
    spam_flags.create(post: post)
  end
end
