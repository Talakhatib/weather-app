require 'net/http'
class WeatherController < ApplicationController

    def search 
        uri = URI('http://host.docker.internal:3001/searches?number_of_searches=10')
        res = Net::HTTP.get_response(uri)
        @searches = JSON.parse(res.body)
        ip = remote_ip()
        result = Geocoder.search(ip)
        flash[:danger] = "City is not found !" if !result.first.city.present?
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
    end

    def api_data 
        city_name = params[:city_name]
        if city_name.blank? 
          flash[:danger]="You need to enter a city name"
          redirect_to root_path
        end
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
          uri = URI('http://host.docker.internal:3001/city_weathers')
          res = Net::HTTP.post_form(uri,{'country'=>@country,'name'=>@name,'temperature'=>@temperature.to_s,'weather_description'=>@weather_description,'&wind_speed'=>@wind_speed.to_s,'wind_degree'=>@wind_degree.to_s})
          result = JSON.parse(res.body)
          if result["error"].present?
            flash[:danger] = result["error"]
            redirect_to root_path
          end
          uri = URI('http://host.docker.internal:3001/searches?number_of_searches=11')
          res = Net::HTTP.get_response(uri)
          searches_data = JSON.parse(res.body)
          @searches = searches_data[1..10]# exclude the last element
          respond_to do |format|
            format.turbo_stream
            format.html { redirect_to root_path }
          end
        else 
          flash[:danger] = "You need to enter a uncorrect city name .Please try again !!"
          redirect_to root_path
        end
     end

end
