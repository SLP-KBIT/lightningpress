class UsersController < ApplicationController
  def index
    @member = Member.where(id: session[:member_id]).first
  end
  def top
    candidate_election
  end
  
  def candidate_election
    p session[:member_id]
    @recruiting_requests = Request.where(contributor_id: session[:member_id], presenter_id: nil)
    @candidates = {}
    @recruiting_requests.each_with_index do |request,i|
      @candidates.store(request.id ,Candidate.where(request_id: request.id))
    end

  end

end
