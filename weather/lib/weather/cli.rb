class Weather::Cli
  def self.call
    puts "Welcome to the TimeandDate.com Weather section!"
    new.start
  end

  def list
    puts " "
    puts "World Temperatures – Weather Around The World"
    Weather::WeatherConditions.all_cities.each.with_index(1) do |city, index|
      puts "#{index}.  #{city}"
    end
  end

  def start
    list
    puts " "
    puts "Which location would you like to check the weather for? Please enter the number corresponding to the particular city."
    input = gets.strip.to_i

    print_weather_information(input)

    puts " "
    puts "Would you like to view the weather for another city? Enter yes or no."

    while input != exit
      input = gets.strip.downcase

      case input
      when "yes"
        start
      when "no"
        puts " "
        puts "Thank you for using TimeandDate.com! We hope to see you again soon."
        exit
      else
        puts " "
        puts "The selection that was entered is not valid. Please enter yes or no if you would like to view the weather for another city."
        start
      end
    end
  end
end
