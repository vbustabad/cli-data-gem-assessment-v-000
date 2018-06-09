class TopBeachToursinNorthAmerica::Tours

  attr_accessor :name, :price, :duration, :location, :description, :transportation_used, :tour_ID, :activity_level, :age_restrictions, :special_medical_restriction

  @@all = []

  def initialize
    @name = name
	  @price = price
    @duration = duration
    @@all << self
  end

  def self.all
    @@all
  end

end
