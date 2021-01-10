require 'rails_helper'

describe "Weather" do
  it "creates objects" do
    response = File.read('spec/fixtures/image_test_data.json')
    image = JSON.parse(response, symbolize_names: true)

    image_data = Image.new(image)

    expect(image_data.image_url).to eq(image[:data][0][:images][:original][:url])
    expect(image_data.image_url).to eq("https://media2.giphy.com/media/3oEdvbelTmMXOQ9VDO/giphy.gif?cid=c0f5ef4d635s2k3f55zv1bl6b0qqk30twtptungpmnwu49f2&rid=giphy.gif")
  end
end
