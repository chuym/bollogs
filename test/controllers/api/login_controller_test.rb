module Admin
  class LoginControllerTest < ActionController::TestCase
    test "should render index for logged off users" do
      get :index
      assert_response :ok
    end
  end
end
