module Admin
  class BaseController < ApplicationController
    include UserSession, Acl

    before_action :has_session
    add_flash_types :error
    layout "admin"
  end
end
