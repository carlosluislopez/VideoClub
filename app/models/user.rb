class User < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email

  has_secure_password

  validate :age_mayo_than_16
  
  has_many :streams
  accepts_nested_attributes_for :streams, reject_if: :all_blank

  
  

  def age_mayo_than_16  		
  	if (Date.today.year - year_birth) < 16
      errors.add(:year_birth, "Must be at least 16 years")
    end
  end

  def self.gender_options
    ["MASCULINO", "FEMENINO"]
  end



end
