class LtRequestsController < ApplicationController
  def index
    @requests = Request.all
    @request_new = Request.new
    @member = Member.all
  end
  def create
    @request = request.new(request_params)
    @request.save
    redirect_to requests_path
  end
  def requests_params
    params.require(:request).permit(:title, :content, :presenter_id)
  end
end
