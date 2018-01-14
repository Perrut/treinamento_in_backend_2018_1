require 'test_helper'

class StoresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get stores_new_url
    assert_response :success
  end

  test "should get index" do
    get stores_index_url
    assert_response :success
  end

end
