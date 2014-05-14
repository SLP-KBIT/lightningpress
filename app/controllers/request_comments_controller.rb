class RequestCommentsController < ApplicationController
  before_action :get_request
  def index
    @request = Request.where(id: params[:request_id]).first
  end
  def show
    @comments = @request.request_comments
    render :show_comments
  end

  def create
    @requestcomment = RequestComment.new(request_comments_params)
    @requestcomment.member_id = @current_member.id
    @requestcomment.save
    redirect_to lt_requests_path
  end

  def disable
    @request_comment = RequestComment.find(params[:id])
    @request_comment.destroy
    redirect_to lt_requests_path(@request_comment.request_id)
  end

  private

  def request_comments_params
    params.require(:request_comment).permit(
      :request_id,
      :content,
      :member_id
    )
  end

  def get_request
    @request = Request.where(id: params[:id]).first if params[:id]
  end
end
