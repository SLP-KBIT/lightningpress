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
    @result = @request.save
    if @result
      flash.now[:success] = "リクエストを作成しました。"
      @request = Request.new
    else 
      flash.now[:error] = "リクエストの作成に失敗しました。"
    end
    @requests = Request.order(:id).all
    @members = Member.all
    render action: :index
  end

  def update
    @request = Request.where(id: params[:id]).first
    @result = @request.update_attributes(requests_params)
    if @result
      flash[:success] = "リクエストを編集しました。"
    else 
      flash[:error] = "リクエストの編集に失敗しました。"
    end
    redirect_to action: :index
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
    if @result
      flash[:success] = "リクエストを削除しました。"
    else 
      flash[:error] = "リクエストの削除に失敗しました。"
    end
    redirect_to action: :index
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
