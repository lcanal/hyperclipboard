require "test_helper"

class ClipControllerTest < ActionDispatch::IntegrationTest
  test "should get save" do
    get clip_save_url
    assert_response :success
  end
end
