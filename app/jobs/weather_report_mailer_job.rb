class WeatherReportMailerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    
    User.find_each do |user|
      WeatherReportMailer.daily_weather_report(user).deliver_now
    end
  end
end
