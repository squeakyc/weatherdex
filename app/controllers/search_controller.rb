class SearchController < ApplicationController
  def new
  end

  def results
    result = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{params[:zipcode]}&units=imperial&appid=#{Figaro.env.open_weather_map_api_key}")

    if result.code == 200
      #conditions
      @name = result['name']
      @description = result['weather'].first['description']
      # first gives you the first object in the the hash - it's just how the weather app has it set up
      @icon = result['weather'].first['icon']
      @temp = result['main']['temp']
      @temp_high = result['main']['temp_max']
      @temp_low = result['main']['temp_min']
      @humidity = result['main']['humidity']
    else
      @error_message = result['message']
    end


  end
end
