class TochiSlideController < ApplicationController
  def index
	@users = Landslide.all
	@hash = Gmaps4rails.build_markers(@users) do |landslides, marker|
	marker.lat landslides.latitude
	marker.lng landsliede.longitude  end
end
end
