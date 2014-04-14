class UsersController < ApplicationController
  def index
    @member = Member.where(id: session[:member_id]).first
  end
  def top

  end
end
