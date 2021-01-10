require 'rails_helper'

describe ImageFacade do
  it "returns image data with weather description" do
    image_data = ImageFacade.fetch_image_data('cloudy')
  
    expect(image_data).to be_a(Image)
    expect(image_data.image_url).to be_a(String)
  end
end
