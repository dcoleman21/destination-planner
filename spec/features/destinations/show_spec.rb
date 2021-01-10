require 'rails_helper'

describe 'Can get current weather for a destination' do
  it "sees the destinations name, zipcode, description and current weather" do
    destination1 = Destination.create!(
      name: 'Arvada',
      zip: '80005',
      description: 'Its a wonderful place',
      image_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrWim1k0SXRZqnC0zAidN1egN8wqJJ35mYJg&usqp=CAU'
    )

    visit '/'

    within(".row") do
      click_link "Show"
    end

    expect(current_path).to eq("/destinations/#{destination1.id}")

    within(".weather") do
      expect(page).to have_css("#date")
      expect(page).to have_css("#current-temp")
      expect(page).to have_css("#high-temp")
      expect(page).to have_css("#low-temp")
      expect(page).to have_css("#description")
    end
  end

  it "shows an image of current weather" do
    destination1 = Destination.create!(
      name: 'Arvada',
      zip: '80005',
      description: 'Its a wonderful place',
      image_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrWim1k0SXRZqnC0zAidN1egN8wqJJ35mYJg&usqp=CAU'
    )

    visit '/'

    within(".row") do
      click_link "Show"
    end

    expect(current_path).to eq("/destinations/#{destination1.id}")

    within(".weather") do
      expect(page).to have_css("#date")
      expect(page).to have_css("#current-temp")
      expect(page).to have_css("#high-temp")
      expect(page).to have_css("#low-temp")
      expect(page).to have_css("#description")
      expect(page).to have_css("#weather-image")
    end
  end
end


# As a user
# When I visit "/"
# And I click on a destination
# Then I should be on page "/destinations/:id"
# Then I should see the destination's name, zipcode, description, and current weather
# The weather forecast is specific to the destination whose page I'm on
# The forecast should include date (weekday, month and day), current, high and low temps in Fahrenheit, and a summary (for example "light rain", "clear sky", etc.)
