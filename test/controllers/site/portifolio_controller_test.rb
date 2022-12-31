require "test_helper"

class Site::PortifolioControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get site_portifolio_index_url
    assert_response :success
  end
end
