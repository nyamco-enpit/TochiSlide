json.extract! landslide, :id, :country, :latitude, :longitude, :city, :description, :comment, :weather, :temp, :humidity, :date, :created_at, :updated_at
json.url landslide_url(landslide, format: :json)