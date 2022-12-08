require 'rails_helper'

RSpec.describe CityWeather, type: :model do
  context "validation test" do 
    it "presence of country" do 
      city_weather = CityWeather.new(name:"saida",temperature: 17,weather_description:"Partly Cloudy",wind_speed: 20,wind_degree: 210).save
      expect(city_weather).to eq(false)
    end

    it "presence of name" do 
      city_weather = CityWeather.new(country:"Lebanon",temperature: 17,weather_description:"Partly Cloudy",wind_speed: 20,wind_degree: 210).save
      expect(city_weather).to eq(false)
    end

    it "presence of temperature" do 
      city_weather = CityWeather.new(country:"Lebanon",name:"saida",weather_description:"Partly Cloudy",wind_speed: 20,wind_degree: 210).save
      expect(city_weather).to eq(false)
    end

    it "presence of weather description" do 
      city_weather = CityWeather.new(country:"Lebanon",name:"saida",temperature: 17,wind_speed: 20,wind_degree: 210).save
      expect(city_weather).to eq(false)
    end

    it "presence of wind speed" do 
      city_weather = CityWeather.new(country:"Lebanon",name:"saida",temperature: 17,weather_description:"Partly Cloudy",wind_degree: 210).save
      expect(city_weather).to eq(false)
    end

    it "presence of wind degree" do 
      city_weather = CityWeather.new(country:"Lebanon",name:"saida",temperature: 17,weather_description:"Partly Cloudy",wind_speed: 20).save
      expect(city_weather).to eq(false)
    end

    it "should successfully save" do 
      city_weather = CityWeather.new(country:"Lebanon",name:"saida",temperature: 17,weather_description:"Partly Cloudy",wind_speed: 20,wind_degree: 210).save
      expect(city_weather).to eq(true)
    end
  end
end
