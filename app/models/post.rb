class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :spam_flags

  validates :body, presence: true
  validates :title, presence: true

  def flagged_by?(user)
    spam_flags.find_by(user: user)
  end
end
