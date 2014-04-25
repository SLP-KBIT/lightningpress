class UsersController < ApplicationController
  def index
    @member = Member.where(id: session[:member_id]).first
  end

  def top
    candidate_election
  end

  def update
    @member = Member.where(id: params[:id]).first
    @member.update_attributes(member_params)
    @member.save
    redirect_to users_path
  end

  private

  def candidate_election
    @recruiting_requests = Request.where(contributor_id: session[:member_id], status: Request::Status::None)
    @candidates = {}
    @recruiting_requests.each_with_index do |request,i|
      @candidates.store(request.id ,Candidate.where(request_id: request.id))
    end
  end

  def member_params
    params.require(:member).permit(
      :name,
      :student_number,
      :account,
      :password,
      :password_confirmation
    )
  end
end
