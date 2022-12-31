require "test_helper"

class Site::AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get site_about_index_url
    assert_response :success
  end
end
