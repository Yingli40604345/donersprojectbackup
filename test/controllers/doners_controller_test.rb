require 'test_helper'

class DonersControllerTest < ActionController::TestCase
  setup do
    @doner = doners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doner" do
    assert_difference('Doner.count') do
      post :create, doner: { age: @doner.age, associations: @doner.associations, description: @doner.description, donation_YTD: @doner.donation_YTD, donation_goal: @doner.donation_goal, education: @doner.education, employer: @doner.employer, gender: @doner.gender, life_event: @doner.life_event, location: @doner.location, military: @doner.military, name: @doner.name, networth: @doner.networth, position: @doner.position, race: @doner.race, religion: @doner.religion, zip: @doner.zip }
    end

    assert_redirected_to doner_path(assigns(:doner))
  end

  test "should show doner" do
    get :show, id: @doner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @doner
    assert_response :success
  end

  test "should update doner" do
    patch :update, id: @doner, doner: { age: @doner.age, associations: @doner.associations, description: @doner.description, donation_YTD: @doner.donation_YTD, donation_goal: @doner.donation_goal, education: @doner.education, employer: @doner.employer, gender: @doner.gender, life_event: @doner.life_event, location: @doner.location, military: @doner.military, name: @doner.name, networth: @doner.networth, position: @doner.position, race: @doner.race, religion: @doner.religion, zip: @doner.zip }
    assert_redirected_to doner_path(assigns(:doner))
  end

  test "should destroy doner" do
    assert_difference('Doner.count', -1) do
      delete :destroy, id: @doner
    end

    assert_redirected_to doners_path
  end
end
