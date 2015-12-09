module Admin
  class BaseController < ApplicationController
    include UserSession, Acl

    before_action :has_session
    add_flash_types :error
    layout "admin"

    protected

    def not_found
      render '404', status: :not_found, layout: "error"
    end
  end
end
