class User < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  
  has_many :streams

	def self.gender_options
    ["MASCULINO", "FEMENINO"]
  end

end
