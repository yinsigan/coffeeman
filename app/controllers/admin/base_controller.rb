class Admin::BaseController < ApplicationController
  layout 'admin'

  before_filter :require_admin

  def require_admin
    unless current_user.admin?
      redirect_to root_url
    end
  end
end
