module Acl extend ActiveSupport::Concern

  protected

  def has_session
    redirect_to controller: 'login', action: 'index' unless current_user
  end
end
