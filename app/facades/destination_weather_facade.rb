class DestinationWeatherFacade
  def self.fetch_weather_data(id)
    destination = Destination.find(id)
    zip = destination.zip
    weather_info = WeatherService.weather_info(zip)
    weather = Weather.new(weather_info)
    description = weather.description
    image_info = ImageService.image_info(description)
    image = Image.new(image_info)
    DestinationWeather.new(destination, weather, image)
  end
end
