class LtRequestsController < ApplicationController
  def index
    @requests = Request.all
    @request_new = Request.new
    @member = Member.all
  end
  def create
    @request = Request.new(requests_params)
    @request.save
    redirect_to lt_requests_path
  end
  def requests_params
    params.require(:request).permit(:title, :content, :presenter_id, :contributor_id)
  end
end
