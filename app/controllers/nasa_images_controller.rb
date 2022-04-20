class NasaImagesController < ApplicationController
  def welcome
    client = Faraday.get("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=#{Rails.application.credentials.nasa_key}")
    @images = JSON.parse(client.body)['photos']

    city = params[:city] || "cape town"
    city_search_url = "http://api.openweathermap.org/geo/1.0/direct?q=#{city}&appid=#{Rails.application.credentials.weather_api_key}"
    city_result = Faraday.get city_search_url
    
    puts "DEBUGHERE"
    puts city_result.body
    puts JSON.parse(city_result.body).first
    lat = JSON.parse(city_result.body).first['lat'] || "33.918861"
    long = JSON.parse(city_result.body).first['long'] || "18.423300"
    weather_url = "https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{long}&appid=#{Rails.application.credentials.weather_api_key}&units=metric"
    @weather_result = Faraday.get weather_url
  end
end
