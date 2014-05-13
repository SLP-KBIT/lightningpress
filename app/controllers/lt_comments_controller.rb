class LtCommentsController < ApplicationController
  def create
    @lt_comment = LtComment.new(lt_comment_params)
    @lt_comment.member_id = @current_member.id
    @lt_comment.save
    redirect_to lightningtalk_path(@lt_comment.lightningtalk_id)
  end

  def new
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
