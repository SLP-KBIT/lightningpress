class LightningtalksController < ApplicationController
  def show
    @lightningtalk = Lightningtalk.where(id: params[:id]).first
    @members = Member.all
    @lt_comments = @lightningtalk.lt_comments.select{|lc| ! lc.new_record? }
  end

  def update
    @lightningtalk = Lightningtalk.where(id: params[:id]).first
    unless params[:lightningtalk][:file].blank?
      @lightningtalk.file_save(params[:lightningtalk][:file])
    end
    @lightningtalk.update_attributes(lightningtalk_params)
    redirect_to lightningtalk_path(@lightningtalk.id)
  end

  def archive
    @lightningtalk = Lightningtalk.all.where(id: params[:id]).first
    filename = @lightningtalk.content_path
    send_file("#{filename}")
  end

  private

  def lightningtalk_params
    params.require(:lightningtalk).permit(
      :name,
      :member_id,
      :performance_date,
      :content_path,
      :sumally
    )
  end
end
