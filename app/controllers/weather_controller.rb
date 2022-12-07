require 'net/http'
class WeatherController < ApplicationController

    def search 

    end

    def api_data 
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
        respond_to do |format|
            format.turbo_stream
            format.html { redirect_to search_path }
        end
     end
end
