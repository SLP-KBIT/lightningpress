class LtRequestsController < ApplicationController
  def index
    @requests = Request.all
  end 
end
