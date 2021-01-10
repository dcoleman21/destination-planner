require 'rails_helper'

describe "Weather" do
  it "creates objects" do
    attr = {
      :coord=>{:lon=>-105.1097, :lat=>39.8422},
      :weather=>[{:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04d"}],
      :base=>"stations",
      :main=>{:temp=>29.88, :feels_like=>23.85, :temp_min=>27, :temp_max=>32, :pressure=>1025, :humidity=>80},
      :visibility=>10000,
      :wind=>{:speed=>2.66, :deg=>112},
      :clouds=>{:all=>75},
      :dt=>1610301819,
      :sys=>{:type=>1, :id=>3444, :country=>"US", :sunrise=>1610288477, :sunset=>1610322871},
      :timezone=>-25200,
      :id=>0,
      :name=>"Arvada",
      :cod=>200
    }

    weather = Weather.new(attr)

    expect(weather).to be_a(Weather)
    expect(weather.date).to eq(Time.at(attr[:dt]).strftime('%A-%B-%e-%Y'))
    expect(weather.current_temp).to eq(attr[:main][:temp])
    expect(weather.high_temp).to eq(attr[:main][:temp_max])
    expect(weather.low_temp).to eq(attr[:main][:temp_min])
    expect(weather.description).to eq(attr[:weather][0][:description])
  end
end
