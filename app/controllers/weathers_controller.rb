class WeathersController < ApplicationController

  def index
    puts ">>> Weather Index Route"
    @raw_weather = Faraday.get 'https://api.openweathermap.org/data/2.5/weather?zip=85205,us&appid=8e6a821f8ce110463faa10800583add5'
    @weather = JSON(@raw_weather.body)
  end

  def create
    puts ">>> Weather Create Route"
    raw_weather = Faraday.get("https://api.openweathermap.org/data/2.5/weather?zip=#{params['zip']}&appid=8e6a821f8ce110463faa10800583add5")
    @weather = JSON(raw_weather.body)
  end #End Obtain Action
  
end
