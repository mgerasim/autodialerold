require 'test_helper'

class StatspsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @statsp = statsps(:one)
  end

  test "should get index" do
    get statsps_url
    assert_response :success
  end

  test "should get new" do
    get new_statsp_url
    assert_response :success
  end

  test "should create statsp" do
    assert_difference('Statsp.count') do
      post statsps_url, params: { statsp: { abonqueue: @statsp.abonqueue, countreg: @statsp.countreg, freeoper: @statsp.freeoper, newsps: @statsp.newsps } }
    end

    assert_redirected_to statsp_url(Statsp.last)
  end

  test "should show statsp" do
    get statsp_url(@statsp)
    assert_response :success
  end

  test "should get edit" do
    get edit_statsp_url(@statsp)
    assert_response :success
  end

  test "should update statsp" do
    patch statsp_url(@statsp), params: { statsp: { abonqueue: @statsp.abonqueue, countreg: @statsp.countreg, freeoper: @statsp.freeoper, newsps: @statsp.newsps } }
    assert_redirected_to statsp_url(@statsp)
  end

  test "should destroy statsp" do
    assert_difference('Statsp.count', -1) do
      delete statsp_url(@statsp)
    end

    assert_redirected_to statsps_url
  end
end
