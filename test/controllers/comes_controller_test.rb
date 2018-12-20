require 'test_helper'

class ComesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get comes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get comes_destroy_url
    assert_response :success
  end

end
