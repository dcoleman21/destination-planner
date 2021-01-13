class DestinationWeather
  attr_reader :id,
              :date,
              :current_temp,
              :high_temp,
              :low_temp,
              :description,
              :name,
              :image_url,
              :zip

  def initialize(destination, weather, image)
    @id = destination.id
    @date = weather.date
    @current_temp = weather.current_temp
    @high_temp = weather.high_temp
    @low_temp = weather.low_temp
    @description = weather.description
    @name = destination.name
    @image_url = image.image_url
    @zip = destination.zip
  end
end
