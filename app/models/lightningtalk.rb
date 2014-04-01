class Lightningtalk < ActiveRecord::Base
  belongs_to :member, foreign_key: :member_id, class_name: Member
  has_many :lt_comments
  has_many :lt_preferences
end
