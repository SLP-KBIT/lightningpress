class Member < ActiveRecord::Base
  has_many :events
end

class Event < ActiveRecord::Base
  has_event_calendar
  belongs_to :member
end
