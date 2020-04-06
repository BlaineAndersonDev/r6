class WeathersController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @weathers = Weather.all.order("created_at DESC").limit(10)
  end

  def create
    # Call the OpenWeatherMap API and retrieve the current weather data.
    response = Faraday.get("https://api.openweathermap.org/data/2.5/weather?zip=#{params['zip']}&units=metric&appid=8e6a821f8ce110463faa10800583add5")

    if response['status'] == 404
      puts "ERROR!!!"
    end

    # Parse the results into usable JSON.
    parsed_weather = JSON(response.body)
    
    # Create varaibles to contain required data for consumption.
    zip = params['zip']
    c_high = parsed_weather['main']['temp_max']
    c_low = parsed_weather['main']['temp_min']
    c_current = parsed_weather['main']['temp']
    # Calculate averages & convert celsius to fahrenheit.
    c_average = helpers.obtain_average_temperature_celsius(c_high, c_low)
    f_high = helpers.celsius_to_fahrenheit_converter(c_high)
    f_low = helpers.celsius_to_fahrenheit_converter(c_low)
    f_current = helpers.celsius_to_fahrenheit_converter(c_current)
    f_average = helpers.celsius_to_fahrenheit_converter(c_average)

    # Create new entry in Database with prepped data.
    @weather = Weather.create(zip: zip, c_high: c_high, c_low: c_low, c_current: c_current, c_average: c_average, f_high: f_high, f_low: f_low, f_current: f_current, f_average: f_average)
    

    respond_to do |format|
      format.html { render :action => :show }
      format.js
      format.json { render json: @weather }
    end
  end #End Obtain Action

  private

end
