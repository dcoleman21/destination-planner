require 'rails_helper'

describe WeatherFacade do
  it "returns weather data for a given zip" do
    weather_data = WeatherFacade.fetch_weather_data('80005')

    expect(weather_data).to be_a(Weather)
    expect(weather_data.current_temp).to be_a(Numeric)
    expect(weather_data.date).to be_a(String)
    expect(weather_data.description).to be_a(String)
    expect(weather_data.high_temp).to be_a(Numeric)
    expect(weather_data.low_temp).to be_a(Numeric)
  end
end
