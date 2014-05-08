# -*- coding: utf-8 -*-
class LtScheduleController < ApplicationController

  def index
    @lightningtalks = Lightningtalk.all
    @lightningtalk = Lightningtalk.new
  end

  def create
    @lightningtalk = Lightningtalk.new(lightningtalks_params)
    @lightningtalk.member_id = @current_member.id
    @result = @lightningtalk.save
    if @result
      flash.now[:success] = "LTを登録しました。"
      @lightningtalk = Lightningtalk.new
    else 
      flash.now[:error] = "LTの登録に失敗しました。"
    end
    @lightningtalks = Lightningtalk.all
    render action: :index
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
