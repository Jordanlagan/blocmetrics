require 'test_helper'

class RegisteredApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get registered_applications_new_url
    assert_response :success
  end

  test "should get show" do
    get registered_applications_show_url
    assert_response :success
  end

  test "should get edit" do
    get registered_applications_edit_url
    assert_response :success
  end

end
