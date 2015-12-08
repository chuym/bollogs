module Admin
  class PostsControllerTest < ActionController::TestCase
    test "should redirect to login if not authenticated" do
      get :index
      assert_response :found
      assert_redirected_to controller: "login", action: "index"
    end

    test "should render index if logged in" do
    end
  end
end
