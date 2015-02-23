class Stream < ActiveRecord::Base
  validates_numericality_of :amount, greater_than_or_equal_to: 0
  
  belongs_to :user
  belongs_to :movie
end
