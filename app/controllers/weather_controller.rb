require 'net/http'
class WeatherController < ApplicationController

    def search 
        search = Geocoder.search("94.187.1.183")
        city = search.first.city
        uri = URI('http://api.weatherstack.com/current?access_key=be23d19041bdfe894b1589ea3b4736c4&query='+city)
        res = Net::HTTP.get_response(uri) 
        @data = JSON.parse(res.body)
        @searches = CityWeather.arrange_desc.first(10)
    end

    def api_data 
        city_name = params[:city_name]
        if !city_name.blank?
        uri = URI('http://api.weatherstack.com/current?access_key=be23d19041bdfe894b1589ea3b4736c4&query='+params[:city_name])
        res = Net::HTTP.get_response(uri) 
        @data = JSON.parse(res.body)
        country = @data["location"]["country"]
        name = @data["location"]["name"]
        temperature = @data["current"]["temperature"]
        weather_description = @data["current"]["weather_descriptions"].first
        wind_speed = @data["current"]["wind_speed"]
        wind_degree = @data["current"]["wind_degree"]
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
