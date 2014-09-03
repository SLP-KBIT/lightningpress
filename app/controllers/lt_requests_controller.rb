# -*- coding: utf-8 -*-
class LtRequestsController < ApplicationController
  def index
    @requests = Request.order(:id).all
    @request = Request.new
    @members = Member.all
  end

  def create
    @request = Request.new(request_params)
    @request.contributor_id = @current_member.id
    if @request.presenter_id
      @request.status = Request::Status::None
    else
      @request.status = Request::Status::Waiting
      @notification = @request.build_request_notification(
        receiver_id: @request.presenter_id,
        response_status: RequestNotification::ResponseStatus::Unread
      )
    end
    @request.save!
    redirect_to lt_requests_path
  end

  def update
    @request = Request.where(id: params[:id]).first
    @request.update_attributes(request_params)
    redirect_to lt_requests_path
  end

  def request_to
    @request = Request.where(id: params[:id]).first
    @request.presenter_id = params[:presenter_id]
    @request.status = Request::Status::Assigned
    @lightningtalk = Lightningtalk.new(name: @request.title, sumally: @request.content, member_id: @request.presenter_id)
    @lightningtalk.save!
    @request.save!
    redirect_to lt_requests_path
  end

  def disable
    @request = Request.where(id: params[:id]).first
    @request.destroy
    redirect_to lt_requests_path
  end

  def update
    @request = Request.where(id: params[:id]).first
    @request.update_attributes( requests_params )
    redirect_to lt_requests_path
  end

  private

  def request_params
    params.require(:request).permit(
      :title,
      :content,
      :presenter_id,
      :contributor_id,
      :status
    )
  end

end
