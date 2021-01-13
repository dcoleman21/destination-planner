class DestinationWeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :date, :current_temp, :high_temp, :low_temp, :description, :image_url, :name
end
