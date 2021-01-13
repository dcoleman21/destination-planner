require 'rails_helper'

describe "Get Weather Info for a Destination" do
  it "should return JSON with that info" do
    destination1 = Destination.create!(
      name: "Olympic National Park",
      zip: "98362",
      description: "Beautiful lush wildlife",
      image_url: "https://blog.theclymb.com/wp-content/uploads/2018/06/iStock-456053655-1.jpg"
    )

    get "/api/v1/destination-weather/#{destination1.id}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:attributes]).to have_key(:date)
    expect(parsed[:data][:attributes]).to have_key(:current_temp)
    expect(parsed[:data][:attributes]).to have_key(:high_temp)
    expect(parsed[:data][:attributes]).to have_key(:low_temp)
    expect(parsed[:data][:attributes]).to have_key(:description)
    expect(parsed[:data][:attributes]).to have_key(:image_url)
    expect(parsed[:data][:attributes]).to have_key(:name)
  end
end
