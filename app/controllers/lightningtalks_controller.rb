class LightningtalksController < ApplicationController
  before_action :find_lightningtalk, only: %i(show update archive destroy)

  def show
    if @lightningtalk.performance_date.nil?
      @lightningtalk_date = DateTime.now.strftime("%Y-%m-%d")
    else
      @lightningtalk_date = @lightningtalk.performance_date.strftime("%Y-%m-%d")
    end
    @members = Member.all
    @lt_comments = @lightningtalk.lt_comments.select{|comment| ! comment.new_record? }
  end

  def update
    unless params[:lightningtalk][:file].blank?
      @lightningtalk.file_save(params[:lightningtalk][:file])
    end
    @lightningtalk.update_attributes(lightningtalk_params)
    redirect_to lightningtalk_path(@lightningtalk.id)
  end

  def archive
    filename = @lightningtalk.content_path
    send_file("#{filename}")
  end

  def destroy
    @lightningtalk.destroy
    redirect_to lt_schedule_index_path
  end

  private

  def find_lightningtalk
    @Lightningtalk = Lightningtalk.where(id: params[:id]).first
  end

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
