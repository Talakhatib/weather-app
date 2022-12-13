# Preview all emails at http://localhost:3000/rails/mailers/weather_report_mailer
class WeatherReportMailerPreview < ActionMailer::Preview

    # http://localhost:3000/rails/mailers/weather_report_mailer/daily_weather_report
    def daily_weather_report
        user = User.last
        WeatherReportMailer.daily_weather_report(user)
    end

end
