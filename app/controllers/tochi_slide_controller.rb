class TochiSlideController < ApplicationController
  def index
	@users = Landslide.all
	@hash = Gmaps4rails.build_markers(@users) do |landslide, marker|
	marker.lat landslide.latitude
	marker.lng landslide.longitude  end
end
end
