require 'rails_helper'

describe "Destination Weather" do
  it "exists" do
    destination = Destination.create(
      id: 1,
      name: "Arvada",
      zip: 80005,
      description: "Growing fast",
      image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8wEsMvmI4Q6CbEoakZMiyc8Kd437htv6e8Q&usqp=CAU"
    )
    weather_info = {
      dt: 1610638888,
      main: {temp:30.61, temp_min:27, temp_max:33.8},
      weather: [{description: "scattered clouds"}]
    }
    weather = Weather.new(weather_info)
    # weather = WeatherFacade.fetch_weather_data(80005)
    image_info = {data:
      [{images:
        {original:
          {url: "https://media4.giphy.com/media/G7XzhrnRdxNjW/giphy.gif?cid=c0f5ef4d7bkeeinao60drb1xy3m7ct21wz5kpzie6s8sejwk&rid=giphy.gif"}}}]}

    image = Image.new(image_info)
    # image = ImageFacade.fetch_image_data(weather.description)
    destination_weather = DestinationWeather.new(destination, weather, image)

    expect(destination_weather.id).to eq(destination.id)
    expect(destination_weather.date).to eq(weather.date)
    expect(destination_weather.current_temp).to eq(weather.current_temp)
    expect(destination_weather.high_temp).to eq(weather.high_temp)
    expect(destination_weather.low_temp).to eq(weather.low_temp)
    expect(destination_weather.description).to eq(weather.description)
    expect(destination_weather.name).to eq(destination.name)
    expect(destination_weather.image_url).to eq(image.image_url)
    expect(destination_weather.zip).to eq(destination.zip)
  end
end
