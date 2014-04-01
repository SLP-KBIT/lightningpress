class Request < ActiveRecord::Base
  belongs_to :contributor, foreign_key: :contributor_id, class_name: Member
  belongs_to :presenter, foreign_key: :presenter_id, class_name: Member
  has_many :requst_comments
  has_many :candidates
  has_many :request_preferences
  has_one :request_notification
end
