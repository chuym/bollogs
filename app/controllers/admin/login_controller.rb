module Admin
  class LoginController < ApplicationController
    layout 'login'

    def index
    end

    def create
      user = User.find_by(username: login_request[:username]).try(:authenticate, login_request[:password])
      if user
        session[:user_id] = user.id
        redirect_to controller: 'dashboard', action: 'index'
      else
        flash[:error] = t('errors.authentication.failed')
        render :index, status: :unauthorized
      end
    end

    def destroy
      reset_session
      redirect_to action: 'index'
    end

    private

    def login_request
      params.require(:login).permit(:username, :password)
    end

  end
end
