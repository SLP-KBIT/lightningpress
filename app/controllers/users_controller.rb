class UsersController < ApplicationController
  def index
    @member = Member.where(id:session[:member_id])
  end
  def top
    
  end
end
