class LtCommentsController < ApplicationController
  def create
    @lt_comment = LtComment.new(lt_comment_params)
    @lt_comment.member_id = @current_member.id
    @lt_comment.save!
    redirect_to lightningtalk_path(@lt_comment.lightningtalk_id)
  end

  def new
  end

  def disable
    @lt_comment = LtComment.where(id: params[:id]).first
    @lt_comment.destroy
    redirect_to lightningtalk_path(@lt_comment.lightningtalk.id)
  end

  private

  def lt_comment_params
    params.require(:lt_comment).permit(
      :lightningtalk_id,
      :member_id,
      :content
    )
  end
end
