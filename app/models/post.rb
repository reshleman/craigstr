class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :body, presence: true
  validates :title, presence: true
end
