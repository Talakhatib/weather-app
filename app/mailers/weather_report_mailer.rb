class WeatherReportMailer < ApplicationMailer

    def daily_weather_report(user) 
        @user = user
        city_user = CityUser.find_by(user: user)
        city_name = city_user.his_city
        uri = URI('http://api.weatherstack.com/current?access_key=be23d19041bdfe894b1589ea3b4736c4&query='+city_name)
        res = Net::HTTP.get_response(uri) 
        @data = JSON.parse(res.body)
        @country = @data["location"]["country"]
        @name = @data["location"]["name"]
        @temperature = @data["current"]["temperature"]
        @weather_description = @data["current"]["weather_descriptions"].first
        @wind_speed = @data["current"]["wind_speed"]
        @wind_degree = @data["current"]["wind_degree"]

        mail to: @user.email , subject: "Daily Weather Report"
    end
end
