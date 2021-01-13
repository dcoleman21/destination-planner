require 'rails_helper'

describe "Destination Weather" do
  it "creates objects" do
  data = {
            "data": {
              "id": "206",
              "type": "destination-weather",
              "attributes": {
                "date": "Wednesday-January-13-2021",
                "current_temp": 41.79,
                "high_temp": 44.6,
                "low_temp": 39,
                "description": "clear sky",
                "name": "Olympic National Park",
                "image_url": "https://media3.giphy.com/media/l1J9IQ6b9EtsW9QFG/giphy.gif?cid=c0f5ef4dxjv2j9aphtei6nctj43f6gyd929b8h7nbgqve01b&rid=giphy.gif",
                "zip": "98362"
              }
            }
          }
  end
end
