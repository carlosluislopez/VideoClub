class Movie < ActiveRecord::Base
	validates_presence_of :title
  validates_numericality_of :price, greater_than_or_equal_to: 0
  validates :description, length: { maximum: 200 } 
  
  belongs_to :genre
  has_many :streams
  


  #before_save :set_true_to_new_movie

  def get_movie_price(movie_id)

  	if movie_id.present?
  		movie = Movie.find(movie_id)
  		movie.price
  	else
  		0
    end
	end

  

  def decorate_price
    "Lps. #{price}"
  end

  def decorate_released_at
    if self.released_at.present?
      self.released_at.strftime("%e %b %Y")
    end
  end

  def set_true_to_new_movie
    if self.available.present?
      self.available = self.available
    else
      self.available = true
    end
  end

end
