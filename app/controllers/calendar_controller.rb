class CalendarController < ApplicationController
  
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @shown_month = Date.civil(@year, @month)
    @event_strips = Event.event_strips_for_month(@shown_month)

    @events = Event.all
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.end_at = @event.start_at
    @event.save
    redirect_to calendar_path
  end

  def event_params
    params.require(:event).permit(:name, :member_id, :start_at, :content_path)
  end
  
end
