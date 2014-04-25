# -*- coding: utf-8 -*-
class LtRequestsController < ApplicationController
  def index
    @requests = Request.order(:id).all
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

  def update
    @request = Request.where(id: params[:id]).first
    @request.update_attributes(request_params)
    @request.save
    redirect_to lt_requests_path
  end

  def request_to
    @request = Request.where(id: params[:id]).first
    @request.presenter_id = params[:presenter_id]
    @request.status = Request::Status::Assigned
    @request.save!
    redirect_to lt_requests_path
  end

  def disable
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to lt_requests_path
  end

  def update
    @request = Request.where(id: params[:id]).first
    @request.update_attributes( requests_params )
    redirect_to lt_requests_path
  end

  private

  def requests_params
    params.require(:request).permit(
      :title,
      :content,
      :presenter_id,
      :contributor_id,
      :status
    )
  end

end
