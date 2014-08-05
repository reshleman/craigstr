class Location < ActiveRecord::Base
  has_many :categories
  validates :name, presence: true
end
