require 'rails_helper'

describe WeatherService do
  it "returns expected data" do
    result = WeatherService.weather_info('80005')

    expect(result).to be_a(Hash)
    expect(result[:weather][0][:description]).to be_a(String)
    expect(result[:dt]).to be_an(Integer)
    expect(result[:main][:temp]).to be_a(Numeric)
    expect(result[:main][:temp_min]).to be_a(Numeric)
    expect(result[:main][:temp_max]).to be_a(Numeric)
  end
end
