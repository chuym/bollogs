require 'test_helper'

class PostsFlowTest < ActionDispatch::IntegrationTest

  # Index Tests
  test "should redirect to login page if no session" do
    check_login_redirect :get, "/admin/posts"
  end

  test "should render index page and show list of posts if logged in" do
    admin = admin_login users(:admin)
    admin.get "/admin/posts"
    admin.assert_response :ok
    admin.assert_select 'tbody#post_list > tr', 5
  end

  # Create Tests
  test "should return to login page if attempting to post without session" do
    check_login_redirect :post, "/admin/posts"
  end

  test "should create post with all parameters correctly set" do
    admin = admin_login users(:admin)
    admin.post "/admin/posts", post: {
                 title: "Post Sample",
                 content: "Post Contents!",
                 javascripts: ["jquery", "mathlab" ]
               }
    admin.assert_response :found
    admin.assert_equal '/admin/posts', admin.path
  end

  test "should fail to save if not passing required parameters" do
    admin = admin_login users(:admin)
    admin.post "/admin/posts", post: {
                 content: "Post Contents!",
                 javascripts: ["jquery", "mathlab" ]
               }
    admin.assert_response :found
    admin.follow_redirect!
    assert admin.flash[:error], "Errors not assigned to view"
    admin.assert_equal '/admin/posts/new', admin.path
  end

  test "should fail to save if not passing request in post object" do
    admin = admin_login users(:admin)
    admin.post "/admin/posts"
    admin.assert_response :found
    admin.follow_redirect!
    assert admin.flash[:error], "Errors not assigned to view"
    admin.assert_equal '/admin/posts/new', admin.path
  end
end
