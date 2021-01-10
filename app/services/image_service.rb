class ImageService
  def self.image_info(description)
    response = conn.get("/v1/gifs/search?q=#{description}&lang=en")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    conn = Faraday.new(url: "https://api.giphy.com") do |f|
      f.params['api_key'] = ENV['GIPHY_API_KEY']
    end
  end
end
