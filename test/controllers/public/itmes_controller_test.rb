require "test_helper"

class Public::ItmesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_itmes_index_url
    assert_response :success
  end

  test "should get show" do
    get public_itmes_show_url
    assert_response :success
  end
end
