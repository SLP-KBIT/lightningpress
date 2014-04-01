class Member < ActiveRecord::Base
  has_many :lightningtalks
  has_many :lt_comments
  has_many :request_comments
  has_many :requests
  has_many :candidates
  has_many :lt_preferences
  has_many :request_preferences
  has_many :request_notifications
end
