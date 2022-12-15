require 'net/http'
class WeatherController < ApplicationController

    def search 
        ip = remote_ip()
        city = Geocoder.search(ip).first.city
        uri = URI('https://api.weatherbit.io/v2.0/current?key=36aa05d409f143bebfd437e6ecc5cbc8&city='+city)
        res = Net::HTTP.get_response(uri) 
        @data = JSON.parse(res.body)
        @searches = CityWeather.arrange_desc.first(10)
    end

    def api_data 
        city_name = params[:city_name]
        if !city_name.blank?
        uri = URI('https://api.weatherbit.io/v2.0/current?key=36aa05d409f143bebfd437e6ecc5cbc8&city='+params[:city_name])
        res = Net::HTTP.get_response(uri) 
        @data = JSON.parse(res.body)
        country = @data["data"]["country_code"]
        name = @data["data"]["city_name"]
        temperature = @data["data"]["temp"]
        weather_description = @data["data"]["weather"]["description"]
        wind_speed = @data["data"]["wind_spd"]
        wind_degree = @data["data"]["wind_dir"]
        city = CityWeather.new(country: country,name: name ,temperature: temperature,weather_description: weather_description,wind_speed: wind_speed,wind_degree: wind_degree)
        city.save
        searches = CityWeather.arrange_desc.first(11)
        @searches = searches[1..10]# exclude the last element
        respond_to do |format|
            format.turbo_stream
            format.html { redirect_to root_path }
        end
       else
        flash[:danger]="You need to enter a city name"
        redirect_to root_path
       end
     end

end
