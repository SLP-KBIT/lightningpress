class LtScheduleController < ApplicationController
  def index
    @lightningtalks = Lightningtalk.all
  end
end
