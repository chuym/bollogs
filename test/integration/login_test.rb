require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test "should login with correct credentials" do
    get "/admin/login"
    assert_response :ok
    post_via_redirect "/admin/login", login: { username: users(:admin).username, password: "password" }
    assert_equal '/admin', path
    assert_response :ok
  end

  test "should fail to login with wrong credentials" do
    get "/admin/login"
    assert_response :ok
    post_via_redirect "/admin/login", login: { username: users(:admin).username, password: "wrong" }
    assert_response :unauthorized
    assert_equal '/admin/login', path
  end

  test "should return bad request if missing login parameters" do
    get "/admin/login"
    assert_response :ok
    post_via_redirect "/admin/login"
    assert_response :bad_request
    assert_equal '/admin/login', path
  end
end
