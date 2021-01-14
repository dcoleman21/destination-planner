require 'rails_helper'

describe DestinationWeatherFacade do
  it "returns all the data for a given destination including weather and image" do
    destination = Destination.create(
      id: 1,
      name: "Arvada",
      zip: 80005,
      description: "Growing fast",
      image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8wEsMvmI4Q6CbEoakZMiyc8Kd437htv6e8Q&usqp=CAU"
    )

    data = DestinationWeatherFacade.fetch_weather_data(destination.id)

    expect(data).to be_a(DestinationWeather)
    expect(data.id).to be_an(Integer)
    expect(data.date).to be_a(String)
    expect(data.description).to be_a(String)
    expect(data.image_url).to be_a(String)
    expect(data.zip).to be_a(String)
    expect(data.current_temp).to be_a(Numeric)
    expect(data.high_temp).to be_a(Numeric)
    expect(data.low_temp).to be_a(Numeric)
  end
end
