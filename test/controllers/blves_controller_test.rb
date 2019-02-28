require 'test_helper'

class BlvesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blf = blves(:one)
  end

  test "should get index" do
    get blves_url
    assert_response :success
  end

  test "should get new" do
    get new_blf_url
    assert_response :success
  end

  test "should create blf" do
    assert_difference('Blf.count') do
      post blves_url, params: { blf: { direction: @blf.direction, other_leg: @blf.other_leg, other_leg_domain: @blf.other_leg_domain, rank: @blf.rank, status: @blf.status, uid: @blf.uid, uuid: @blf.uuid } }
    end

    assert_redirected_to blf_url(Blf.last)
  end

  test "should show blf" do
    get blf_url(@blf)
    assert_response :success
  end

  test "should get edit" do
    get edit_blf_url(@blf)
    assert_response :success
  end

  test "should update blf" do
    patch blf_url(@blf), params: { blf: { direction: @blf.direction, other_leg: @blf.other_leg, other_leg_domain: @blf.other_leg_domain, rank: @blf.rank, status: @blf.status, uid: @blf.uid, uuid: @blf.uuid } }
    assert_redirected_to blf_url(@blf)
  end

  test "should destroy blf" do
    assert_difference('Blf.count', -1) do
      delete blf_url(@blf)
    end

    assert_redirected_to blves_url
  end
end
