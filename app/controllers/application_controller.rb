class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_member
  before_action :login_filter

  def current_member
    if session[:member_id]
      @current_member ||= Member.id_is(session[:member_id]).first
    end
  end

  def login_filter
    redirect_to logins_path unless session[:member_id]
  end

  def admin_filter
    redirect_to root_path unless @current_member.is_admin
  end

  helper_method :current_member
end
