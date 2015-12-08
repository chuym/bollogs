require 'test_helper'

class PostsFlowTest < ActionDispatch::IntegrationTest
  test "should redirect to login page if no session" do
    get "/admin/posts"
    assert_response :found
    follow_redirect!
    assert_equal "/admin/login", path
    assert_response :ok
  end

  test "should render index page and show list of posts if logged in" do
    admin = admin_login users(:admin)
    admin.get "/admin/posts"
    admin.assert_response :ok
    admin.assert_select 'tbody#post_list > tr', 5
  end
end
