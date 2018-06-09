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
      (fahrenheit_temperature.gsub("°F", "").to_i - 32) * 5/9
    end

    def wind
      doc.css("p")[1].children[4].to_s.gsub("Wind: ", "").gsub("mph ", "mph")
    end

    def current_time
      doc.css("#wtct").children.to_s
    end

    def visibility
      doc.css("p")[5].children[1].to_s.gsub(" ", "")
    end

    def pressure
    	doc.css("p")[6].children[1].to_s.gsub(" ", "").gsub("\"", " ")
    end

    def humidity
     	doc.css("p")[7].children[1].to_s.gsub(" ", "")
    end

    def dew_point
    	doc.css("p")[8].children[1].to_s.gsub(" ", "")
    end

    def doc
      @doc ||= Nokogiri::HTML(open("https://www.timeanddate.com#{@url}"))
    end

    def self.find_by_selection(input)
      self.all(input)
    end
end
