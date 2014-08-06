class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates :body, presence: true
  validates :title, presence: true
end
