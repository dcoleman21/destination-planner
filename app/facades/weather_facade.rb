class WeatherFacade
  def self.fetch_weather_data(zip)
    weather_info = WeatherService.weather_info(zip)
    Weather.new(weather_info)
  end
end
