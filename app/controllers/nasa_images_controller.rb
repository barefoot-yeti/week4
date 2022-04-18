class NasaImagesController < ApplicationController
  def welcome
    client = Faraday.get("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=#{Rails.application.credentials.nasa_key}")
    @images = JSON.parse(client.body)['photos']
  end
end
