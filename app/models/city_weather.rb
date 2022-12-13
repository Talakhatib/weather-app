class CityWeather < ApplicationRecord
    
    scope :arrange_desc,-> {order(created_at: :desc)}
    validates :country, presence: true
    validates :name, presence: true
    validates :temperature, presence: true
    validates :weather_description, presence: true
    validates :wind_speed, presence: true
    validates :wind_degree, presence: true

end
