class Stream < ActiveRecord::Base
  validates_numericality_of :amount, greater_than_or_equal_to: 0

  before_validation :set_price
  
  belongs_to :user
  belongs_to :movie

  def set_price
  	self.amount = self.movie.price
  end
  
  def decorate_amount
    "Lps. #{amount}"
  end

  def decorate_created_at
    if self.created_at.present?
      self.created_at.strftime("%e %b %Y")
    end
  end
  
end
