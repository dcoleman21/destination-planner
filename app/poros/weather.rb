class Weather
  attr_reader :date,
              :current_temp,
              :high_temp,
              :low_temp,
              :description

  def initialize(data)
    @date = Time.at(data[:dt]).strftime('%A-%B-%e-%Y')
    @current_temp = data[:main][:temp]
    @high_temp = data[:main][:temp_max]
    @low_temp = data[:main][:temp_min]
    @description = data[:weather][0][:description]
  end
end
