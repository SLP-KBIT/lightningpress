class LtScheduleController < ApplicationController

  def index
    @lightningtalks = Lightningtalk.all
    @lightningtalk = Lightningtalk.new
  end

  def create
    @lightningtalk = Lightningtalk.new(lightningtalks_params)
    @lightningtalk.member_id = @current_member.id
    @lightningtalk.save

    redirect_to lt_schedule_index_path
  end

  def edit
  end

  def update
  end

  def lightningtalks_params
    params.require(:lightningtalk).permit(
      :name,
      :member_id,
      :performance_date,
      :content_path,
      :sumally
    )
  end
end
