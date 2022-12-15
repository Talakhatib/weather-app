class WeatherReportMailer < ApplicationMailer

    def daily_weather_report(user) 
        @user = user
        city_user = CityUser.find_by(user: user)
        city_name = city_user.his_city
        uri = URI('https://api.weatherbit.io/v2.0/current?key=36aa05d409f143bebfd437e6ecc5cbc8&city='+city_name)
        res = Net::HTTP.get_response(uri) 
        @data = JSON.parse(res.body)
        @country = @data["data"]["country_code"]
        @name = @data["data"]["city_name"]
        @temperature = @data["data"]["temp"]
        @weather_description = @data["data"]["weather"]["description"]
        @wind_speed = @data["data"]["wind_spd"]
        @wind_degree = @data["data"]["wind_dir"]

        mail to: @user.email , subject: "Daily Weather Report"
    end
end
