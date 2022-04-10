Rails.application.routes.draw do
  get 'nasa_images/welcome'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "nasa_images#welcome"
end
