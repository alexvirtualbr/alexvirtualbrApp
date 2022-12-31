require "test_helper"

class Site::ContactControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get site_contact_index_url
    assert_response :success
  end
end
