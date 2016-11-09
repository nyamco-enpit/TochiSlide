require 'test_helper'

class LandslidesControllerTest < ActionController::TestCase
  setup do
    @landslide = landslides(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:landslides)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create landslide" do
    assert_difference('Landslide.count') do
      post :create, landslide: { city: @landslide.city, comment: @landslide.comment, country: @landslide.country, date: @landslide.date, description: @landslide.description, humidity: @landslide.humidity, latitude: @landslide.latitude, longitude: @landslide.longitude, temp: @landslide.temp, weather: @landslide.weather }
    end

    assert_redirected_to landslide_path(assigns(:landslide))
  end

  test "should show landslide" do
    get :show, id: @landslide
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @landslide
    assert_response :success
  end

  test "should update landslide" do
    patch :update, id: @landslide, landslide: { city: @landslide.city, comment: @landslide.comment, country: @landslide.country, date: @landslide.date, description: @landslide.description, humidity: @landslide.humidity, latitude: @landslide.latitude, longitude: @landslide.longitude, temp: @landslide.temp, weather: @landslide.weather }
    assert_redirected_to landslide_path(assigns(:landslide))
  end

  test "should destroy landslide" do
    assert_difference('Landslide.count', -1) do
      delete :destroy, id: @landslide
    end

    assert_redirected_to landslides_path
  end
end
