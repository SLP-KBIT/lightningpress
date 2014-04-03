class LightningtalksController < ApplicationController
  def show
    @events = Event.all
    id = params[:id].to_i
    @event = @events.where(id: id).first
    
  end
end
