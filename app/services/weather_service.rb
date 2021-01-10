class WeatherService
  def self.weather_info(zip)
    response = conn.get("/data/2.5/weather?zip=#{zip}&units=imperial")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: "https://api.openweathermap.org") do |f|
      f.params['appid'] = ENV['WEATHER_API_KEY']
    end
  end
end
