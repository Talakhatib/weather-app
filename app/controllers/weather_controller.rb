require 'net/http'
class WeatherController < ApplicationController

    def search 
        @searches = CityWeather.arrange_desc.first(10)
        ip = remote_ip()
        result = Geocoder.search(ip)
        if result.first.city.present?
          city = result.first.city
          uri = URI('https://api.weatherbit.io/v2.0/current?key=36aa05d409f143bebfd437e6ecc5cbc8&city='+city)
          res = Net::HTTP.get_response(uri)
          if  res.class == Net::HTTPOK 
             data = JSON.parse(res.body)
             @country = data["data"].first["country_code"]
             @localtime = data["data"].first["datetime"]
             @name = data["data"].first["city_name"]
             @temperature = data["data"].first["temp"]
             @weather_description = data["data"].first["weather"]["description"]
             @wind_speed = data["data"].first["wind_spd"]
             @wind_degree = data["data"].first["wind_dir"]
          else 
            flash[:danger] = "No result is found for your location !!"
          end
        else 
            flash[:danger] = "City is not found !"
        end
    end

    def api_data 
        city_name = params[:city_name]
        if !city_name.blank?
           uri = URI('https://api.weatherbit.io/v2.0/current?key=36aa05d409f143bebfd437e6ecc5cbc8&city='+params[:city_name])
           res = Net::HTTP.get_response(uri) 
          if  res.class == Net::HTTPOK
            data = JSON.parse(res.body)
            @country = data["data"].first["country_code"]
            @name = data["data"].first["city_name"]
            @temperature = data["data"].first["temp"]
            @weather_description = data["data"].first["weather"]["description"]
            @wind_speed = data["data"].first["wind_spd"]
            @wind_degree = data["data"].first["wind_dir"]
            CityWeather.create(country: @country,name: @name ,temperature: @temperature,weather_description: @weather_description,wind_speed: @wind_speed,wind_degree: @wind_degree)
            searches = CityWeather.arrange_desc.first(11)
            @searches = searches[1..10]# exclude the last element
            respond_to do |format|
             format.turbo_stream
             format.html { redirect_to root_path }
            end
          else 
            flash[:danger] = "You need to enter a correct city name .Please try again !!"
            redirect_to root_path
          end
       else
        flash[:danger]="You need to enter a city name"
        redirect_to root_path
       end
     end

end
