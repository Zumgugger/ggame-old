require 'test_helper'

class ResetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get resets_index_url
    assert_response :success
  end

end
