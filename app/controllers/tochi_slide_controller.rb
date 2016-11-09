class TochiSlideController < ApplicationController
  def index
	@users = landslide.all
	@hash = Gmaps4rails.build_markers(@users) do |landslide, marker|
	marker.lat landslide.latitude
	marker.lng landsliede.longitude  end
end
end
