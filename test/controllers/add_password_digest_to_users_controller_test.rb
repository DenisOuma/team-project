require "test_helper"

class AddPasswordDigestToUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get password_digest" do
    get add_password_digest_to_users_password_digest_url
    assert_response :success
  end
end
