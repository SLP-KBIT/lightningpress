class LtCommentsController < ApplicationController
  def create
    @lt_comment = @current_member.lt_comments.build(lt_comment_params)
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
      :content
    )
  end
end
