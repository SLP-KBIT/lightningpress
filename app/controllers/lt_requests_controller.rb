# -*- coding: utf-8 -*-
class LtRequestsController < ApplicationController
  def index
    @requests = Request.all
    @request = Request.new
    @members = Member.all
  end
  
  def create
    @request = Request.new(requests_params)
    @request.presenter_id? ? @request.status = Request::Status::Waiting : @request.status = Request::Status::None
    @request.contributor_id = @current_member.id
    @request.save
    redirect_to lt_requests_path
  end

  private

  def requests_params
    params.require(:request).permit(
      :title,
      :content,
      :presenter_id,
      :contributor_id
    )
  end
end
