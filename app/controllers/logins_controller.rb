# -*- coding: utf-8 -*-
class LoginsController < ApplicationController
  def index
    render "new"
  end

  def create
    @member = Member.find_by_account params[:account]
    if @member && @member.authenticate(params[:pass])
      session[:member_id] = @member.id
      redirect_to root_path
    else
      flash.now.alert = "もう一度入力してください"
      render "new"
    end
  end
  def destroy
    session[:member_id] = nil
    @current_member = nil
    redirect_to logins_path
  end
end
