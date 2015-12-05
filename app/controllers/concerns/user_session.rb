module UserSession extend ActiveSupport::Concern

  included do
    helper_method :logged_in?, :current_user
  end

  protected

  def logged_in?
    current_user.present?
  end

  def current_user
    @_current_user ||= session[:user_id] &&
        User.find_by(id: session[:user_id])
  end
end
