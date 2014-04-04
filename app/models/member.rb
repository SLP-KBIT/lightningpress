class Member < ActiveRecord::Base
<<<<<<< HEAD
  has_many :events
end

class Event < ActiveRecord::Base
  has_event_calendar
  belongs_to :member

  has_many :lightningtalks
  has_many :lt_comments
  has_many :request_comments
  has_many :requests
  has_many :candidates
  has_many :lt_preferences
  has_many :request_preferences
  has_many :request_notifications
  has_secure_password
end
