require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get Session" do
    get users_Session_url
    assert_response :success
  end

end
