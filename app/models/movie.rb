class Movie < ActiveRecord::Base
	validates_presence_of :title
  validates_numericality_of :price, greater_than_or_equal_to: 0
  
  belongs_to :genre
  has_many :streams
end
