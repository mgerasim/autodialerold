require 'test_helper'

class TotalconfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @totalconfig = totalconfigs(:one)
  end

  test "should get index" do
    get totalconfigs_url
    assert_response :success
  end

  test "should get new" do
    get new_totalconfig_url
    assert_response :success
  end

  test "should create totalconfig" do
    assert_difference('Totalconfig.count') do
      post totalconfigs_url, params: { totalconfig: { template_channel: @totalconfig.template_channel, text: @totalconfig.text, title_app: @totalconfig.title_app, title_setting_trunk: @totalconfig.title_setting_trunk } }
    end

    assert_redirected_to totalconfig_url(Totalconfig.last)
  end

  test "should show totalconfig" do
    get totalconfig_url(@totalconfig)
    assert_response :success
  end

  test "should get edit" do
    get edit_totalconfig_url(@totalconfig)
    assert_response :success
  end

  test "should update totalconfig" do
    patch totalconfig_url(@totalconfig), params: { totalconfig: { template_channel: @totalconfig.template_channel, text: @totalconfig.text, title_app: @totalconfig.title_app, title_setting_trunk: @totalconfig.title_setting_trunk } }
    assert_redirected_to totalconfig_url(@totalconfig)
  end

  test "should destroy totalconfig" do
    assert_difference('Totalconfig.count', -1) do
      delete totalconfig_url(@totalconfig)
    end

    assert_redirected_to totalconfigs_url
  end
end
