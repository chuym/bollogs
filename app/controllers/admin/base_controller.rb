module Admin
  class BaseController < ApplicationController
    include UserSession, Acl

    before_action :has_session

    layout "admin"
  end
end
