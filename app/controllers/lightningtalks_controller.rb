class LightningtalksController < ApplicationController
  def show
    @lightningtalks = Lightningtalk.all
    id = params[:id].to_i
    @lightningtalk = @lightningtalks.where(id: id).first
  end
end
