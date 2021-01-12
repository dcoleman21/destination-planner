require 'rails_helper'

describe "Destination API" do
  before :each do
    @destination1 = Destination.create!(
      name: "Olympic National Park",
      zip: "157151",
      description: "Beautiful lush wildlife",
      image_url: "https://blog.theclymb.com/wp-content/uploads/2018/06/iStock-456053655-1.jpg"
    )

    @destination2 = Destination.create!(
      name: "Missoula",
      zip: "59802",
      description: "Rugged and wild!",
      image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7Dm3zIx7e7bjf8XlGHFY76027GGL5Z_j39g&usqp=CAU"
    )
  end

  it "can return a list of destinations" do
    get "/api/v1/destinations"

    json = JSON.parse(response.body, symbolize_names: true)
    destinations = json[:data]

    expect(response).to be_successful
    expect(destinations.count).to eq(2)

    destinations.each do |destination|
      expect(destination).to have_key(:id)
      expect(destination[:id]).to be_a(String)
      expect(destination).to have_key(:type)
      expect(destination[:type]).to be_a(String)
      expect(destination).to have_key(:attributes)
      expect(destination[:attributes]).to be_a(Hash)
      dest_attr = destination[:attributes]
      expect(dest_attr).to have_key(:name)
      expect(dest_attr[:name]).to be_a(String)
      expect(dest_attr).to have_key(:zip)
      expect(dest_attr[:zip]).to be_a(String)
      expect(dest_attr).to have_key(:description)
      expect(dest_attr[:description]).to be_a(String)
      expect(dest_attr).to have_key(:image_url)
      expect(dest_attr[:image_url]).to be_a(String)
    end
  end

  it "can find a specific destination by id" do
    get "/api/v1/destinations/#{@destination1.id}"

    json = JSON.parse(response.body, symbolize_names: true)
    destinations = json[:data]

    expect(response).to be_successful

    expect(destinations).to have_key(:id)
    expect(destinations[:id]).to be_a(String)
    expect(destinations).to have_key(:type)
    expect(destinations[:type]).to be_a(String)
    expect(destinations).to have_key(:attributes)
    expect(destinations[:attributes]).to be_a(Hash)
    dest_attr = destinations[:attributes]
    expect(dest_attr).to have_key(:name)
    expect(dest_attr[:name]).to be_a(String)
    expect(dest_attr[:name]).to eq(@destination1.name)
    expect(dest_attr).to have_key(:zip)
    expect(dest_attr[:zip]).to be_a(String)
    expect(dest_attr).to have_key(:description)
    expect(dest_attr[:description]).to be_a(String)
    expect(dest_attr).to have_key(:image_url)
    expect(dest_attr[:image_url]).to be_a(String)
  end

  it "can create a destination" do
    destination_params = {
      name: "Apollo Beach",
      zip: "33570",
      description: "A lovely beachy town.",
      image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEqrwSKSay7MQCDSsoxcCQMKf-_cVBouIzeg&usqp=CAU"
    }
    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/destinations', headers: headers, params: JSON.generate(destination_params)

    new_dest = Destination.last

    expect(response).to be_successful
    expect(new_dest.name).to eq(destination_params[:name])
    expect(new_dest.zip).to eq(destination_params[:zip])
    expect(new_dest.description).to eq(destination_params[:description])
    expect(new_dest.image_url).to eq(destination_params[:image_url])
  end

  it "can edit an existing destination" do
    id = @destination2.id
    previous_name = Destination.last.name
    destination_params = { name: "Helena" }
    headers = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/destinations/#{id}", headers: headers, params: JSON.generate(destination_params)
    dest = Destination.find_by(id: id)

    expect(response).to be_successful
    expect(dest.name).to_not eq(previous_name)
    expect(dest.name).to eq("Helena")
  end

  it "can destroy a destination" do
    expect(Destination.count).to eq(2)
    expect{ delete "/api/v1/destinations/#{@destination1.id}" }.to change(Destination, :count).by(-1)

    expect(Destination.count).to eq(1)

    expect(response).to be_successful
    expect{Destination.find(@destination1.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
