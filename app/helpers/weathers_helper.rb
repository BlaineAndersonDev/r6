module WeathersHelper

  # Average temperature = sum of measured temperatures ÷ number of measurements
  def obtain_average_temperature_celsius(high_in_c, low_in_c)
    average = (high_in_c + low_in_c) / 2
  end

  # Fahrenheit (°F) = (Celsius x 1.8) + 32
  def celsius_to_fahrenheit_converter(temp_in_c)
    temp_in_f = (temp_in_c * 1.8) + 32
  end

end
