class Landslide < ActiveRecord::Base
	geocoded_by :city
	after_validation :geocode
end
