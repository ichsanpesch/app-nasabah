require "test_helper"

class NasabahControllerTest < ActionDispatch::IntegrationTest
  test "should get form" do
    get nasabah_form_url
    assert_response :success
  end
end
