class Category < ActiveRecord::Base
  has_many :posts
  belongs_to :location
  validates :name, presence: true
end
