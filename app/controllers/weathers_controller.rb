class WeathersController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @weathers = Weather.all.order("created_at DESC").limit(15)
  end

  def new
    @weathers = Weather.all.order("created_at DESC").limit(15)
    # Call the OpenWeatherMap API and retrieve the current weather data.
    response = Faraday.get("https://api.openweathermap.org/data/2.5/weather?zip=#{params['zip']}&units=metric&appid=8e6a821f8ce110463faa10800583add5")

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

    # Setup a new entry for Database with prepped data.
    @weather = Weather.new(zip: zip, c_high: c_high, c_low: c_low, c_current: c_current, c_average: c_average, f_high: f_high, f_low: f_low, f_current: f_current, f_average: f_average)
    

    respond_to do |format|
      format.html { render :action => :show }
      format.js
      format.json { render json: @weather }
    end
  end

  def create
    puts "~~~~~~~ #{params}"
    @weather = Weather.create(zip: params[:zip], c_high: params[:c_high], c_low: params[:c_low], c_current: params[:c_current], c_average: params[:c_average], f_high: params[:f_high], f_low: params[:f_low], f_current: params[:f_current], f_average: params[:f_average])
    @weathers = Weather.all.order("created_at DESC").limit(15)
  end

  private

    def weathers_params
      params.require(:weathers).permit(:zip, :c_high, :c_low, :c_average, :c_current, :f_high, :f_low, :f_average, :f_current)
    end
end
