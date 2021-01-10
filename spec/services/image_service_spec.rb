require 'rails_helper'

describe ImageService do
  it "returns expected data" do
    result = ImageService.image_info('cloudy')
    
    expect(result).to be_a(Hash)
    expect(result[:data]).to be_an(Array)
    expect(result[:data][0][:images]).to be_a(Hash)
    expect(result[:data][0][:images][:original]).to be_a(Hash)
    expect(result[:data][0][:images][:original][:url]).to be_a(String)
  end
end
