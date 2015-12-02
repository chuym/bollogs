module Admin
  class LoginController < BaseController
    def index
      render "login"
    end

    def create
      render :nothing, status: :no_content
    end

  end
end
