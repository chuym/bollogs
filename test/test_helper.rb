ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def admin_login(user, password='password')
    open_session do |s|
      s.post "/admin/login", login: { username: user.username, password: password }
      assert_response :ok
    end
  end
end
