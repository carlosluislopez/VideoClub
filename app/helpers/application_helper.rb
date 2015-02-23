module ApplicationHelper
	def welcome_text
    "Ya son #{User.count} usuarios registrados y #{Movie.count} peliculas que ofrecemos!!"
  end
end
