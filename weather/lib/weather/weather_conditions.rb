require 'pry'

class Weather::WeatherConditions
  attr_accessor :fahrenheit_temperature, :feels_like_temperature, :celsius_temperature, :current_time, :wind, :visibility, :pressure, :humidity, :dew_point

  @@all_cities = []

    def initialize(city, url)
      @city = city
      @url = url
      @@all_cities << @city
    end

    def self.all_cities
      @@all_cities
    end

    def fahrenheit_temperature
    	doc.css("div.h2").first.children.last.to_s
    end

    def feels_like_temperature
    	doc.css("p")[1].children[0].to_s.gsub("Feels Like: ", "")
    end

    def celsius_temperature
     	@celsius_temperature = (fahrenheit_temperature.gsub("°F", "").to_i - 32) * 5/9
    end

    # def wind
    # 	@wind ||= scrape from website
    # end
    #
    # def current_time
    # 	@current_time ||= scrape from website
    # end
    #
    # def visibility
    # 	@visibility ||= scrape from website
    # end
    #
    # def pressure
    # 	@pressure ||= scrape from website
    # end
    #
    # def humidity
    # 	@humidity ||= scrape from website
    # end
    #
    # def dew_point
    # 	@dew_point ||= scrape from website
    # end

    def doc
      @doc ||= Nokogiri::HTML(open("https://www.timeanddate.com#{@url}"))
    end

    def self.find_by_selection(input)
      self.all(input)
    end
end
