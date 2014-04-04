# -*- coding: utf-8 -*-
class LtRequestsController < ApplicationController
  before_action :sample_filter
  def index
    @requests = Request.all
    @request_new = Request.new
    @member = Member.all
  end
  def create
    @request = Request.new(requests_params)
    @request.presenter_id? ? @request.status = 1 : @request.status = 0
    @request.save
    redirect_to lt_requests_path
  end
  def requests_params
    params.require(:request).permit(:title, :content, :presenter_id, :contributor_id)
  end

  private

  def sample_filter
    redirect_to logins_path unless session[:member_id]
  end
end
