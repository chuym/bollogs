module Admin
  class LoginController < BaseController
    layout 'login'
    def index
    end
    def create
      render nothing: true, status: :no_content
    end
  end
end
