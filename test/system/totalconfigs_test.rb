require "application_system_test_case"

class TotalconfigsTest < ApplicationSystemTestCase
  setup do
    @totalconfig = totalconfigs(:one)
  end

  test "visiting the index" do
    visit totalconfigs_url
    assert_selector "h1", text: "Totalconfigs"
  end

  test "creating a Totalconfig" do
    visit totalconfigs_url
    click_on "New Totalconfig"

    fill_in "Template channel", with: @totalconfig.template_channel
    fill_in "Text", with: @totalconfig.text
    fill_in "Title app", with: @totalconfig.title_app
    fill_in "Title setting trunk", with: @totalconfig.title_setting_trunk
    click_on "Create Totalconfig"

    assert_text "Totalconfig was successfully created"
    click_on "Back"
  end

  test "updating a Totalconfig" do
    visit totalconfigs_url
    click_on "Edit", match: :first

    fill_in "Template channel", with: @totalconfig.template_channel
    fill_in "Text", with: @totalconfig.text
    fill_in "Title app", with: @totalconfig.title_app
    fill_in "Title setting trunk", with: @totalconfig.title_setting_trunk
    click_on "Update Totalconfig"

    assert_text "Totalconfig was successfully updated"
    click_on "Back"
  end

  test "destroying a Totalconfig" do
    visit totalconfigs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Totalconfig was successfully destroyed"
  end
end
