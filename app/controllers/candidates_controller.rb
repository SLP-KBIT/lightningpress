class CandidatesController < ApplicationController
  def create
    @candidate = @current_member.candidates.build(candidates_params)
    @candidate.save
    redirect_to lt_requests_path
  end

  def choose
    @candidate = Candidate.where(id: params[:id]).first
    redirect_to :controller => 'lt_requests', :action => 'request_to', :id => @candidate.request_id, :presenter_id => @candidate.member_id
  end

  def candidates_params
    params.require(:candidate).permit(
      :request_id,
      :member_id
    )
  end

  def disable
    @candidate = Candidate.where(id: params[:id]).first
    @candidate.destroy
    redirect_to lt_requests_path
  end
end
