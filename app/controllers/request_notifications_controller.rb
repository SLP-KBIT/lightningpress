# -*- coding: utf-8 -*-
class RequestNotificationsController < ApplicationController
  def update
    @request = Request.where(id: params[:id]).first
    if params[:response] == "受諾"
      @request.update_attributes(status: Request::Status::Assigned)
      @request.request_notification.update_attributes(receiver_id: @request.contributor_id, response_status: RequestNotification::ResponseStatus::Accept)
      @lightningtalk = Lightningtalk.create(name: @request.title, sumally: @request.content, member_id: @request.presenter_id)
    elsif params[:response] == "拒否"
      @request.update_attributes(status: Request::Status::None)
      @request.request_notification.update_attributes(receiver_id: @request.contributor_id, response_status: RequestNotification::ResponseStatus::Refuse)
    end
    redirect_to root_path
  end

  def destroy
    @notification = RequestNotification.where(id: params[:id]).first
    @notification.destroy
    redirect_to root_path
  end
end
