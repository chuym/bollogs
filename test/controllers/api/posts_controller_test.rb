module Admin
  class PostsControllerTest < ActionController::TestCase
    test "should redirect to login if not authenticated" do
      get :index
      assert_response :found
      assert_redirected_to controller: "login", action: "index"
    end
  end
end
