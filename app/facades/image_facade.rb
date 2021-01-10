class ImageFacade
  def self.fetch_image_data(description)
    image_info = ImageService.image_info(description)
    Image.new(image_info)
  end
end
