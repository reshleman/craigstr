class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :spam_flags

  has_attached_file :image, styles: { medium: "300x300>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :body, presence: true
  validates :title, presence: true

  scope :flagged, -> {
    select("posts.*, count(*) as flag_count").
    joins(:spam_flags).
    group("posts.id").
    order("flag_count DESC, posts.updated_at DESC")
  }

  def flagged_by?(user)
    spam_flags.exists?(user: user)
  end
end
