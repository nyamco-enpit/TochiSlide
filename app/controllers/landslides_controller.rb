require 'net/http'
require 'uri'
require 'json'

class LandslidesController < ApplicationController
  before_action :set_landslide, only: [:show, :edit, :update, :destroy]

  # GET /landslides
  # GET /landslides.json
  def index
    #@landslides = Landslide.all
    @q        = Landslide.search(params[:q])
    @landslides = @q.result(distinct: true)
    @latlng = Gmaps4rails.build_markers(@landslides) do |landslide, marker|
        marker.lat landslide.latitude
        marker.lng landslide.longitude  end
  end

   def get_weather_info(lat, lon)
        
        weatherMapApiUri = "http://api.openweathermap.org/data/2.5/weather"
        uri = URI.parse(weatherMapApiUri + "?APPID=" + ENV["WEATHER_APPID"] + "&lat=" + lat +"&lon=" + lon)
        json = Net::HTTP.get(uri)
        JSON.parse(json)
    end


  # GET /landslides/1
  # GET /landslides/1.json
  def show
  end

  # GET /landslides/new
  def new
    @landslide = Landslide.new
  end

  # GET /landslides/1/edit
  def edit
  end

  # POST /landslides
  # POST /landslides.json
  def create 
       lat = params[:landslide][:latitude]
       lng = params[:landslide][:longitude]
    if lat != "" and lng != ""
       result = get_weather_info(lat, lng)
       params[:landslide][:temp] = result['main']['temp']
       params[:landslide][:weather] = result['weather'][0]['main']
       params[:landslide][:humidity] = result['main']['humidity']
    end
    
    @landslide = Landslide.new(landslide_params)

    respond_to do |format|
      if @landslide.save
        format.html { redirect_to @landslide, notice: 'Landslide was successfully created.' }
        format.json { render :show, status: :created, location: @landslide }
      else
        format.html { render :new }
        format.json { render json: @landslide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /landslides/1
  # PATCH/PUT /landslides/1.json
  def update
    respond_to do |format|
      if @landslide.update(landslide_params)
        format.html { redirect_to @landslide, notice: 'Landslide was successfully updated.' }
        format.json { render :show, status: :ok, location: @landslide }
      else
        format.html { render :edit }
        format.json { render json: @landslide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /landslides/1
  # DELETE /landslides/1.json
  def destroy
    @landslide.destroy
    respond_to do |format|
      format.html { redirect_to landslides_url, notice: 'Landslide was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landslide
      @landslide = Landslide.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def landslide_params
      params.require(:landslide).permit(:country, :latitude, :longitude, :city, :description, :comment, :weather, :temp, :humidity, :date)
    end

end
