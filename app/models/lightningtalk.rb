# == Schema Information
#
# Table name: lightningtalks
#
#  id               :integer          not null, primary key
#  name             :text
#  member_id        :text
#  performance_date :datetime
#  content_path     :text
#  created_at       :datetime
#  updated_at       :datetime
#  sumally          :text
#  deleted_at       :datetime
#

class Lightningtalk < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :member, foreign_key: :member_id, class_name: Member
  has_many :lt_comments
  has_many :lt_preferences
  validates :name, :member_id, :performance_date, :sumally, presence: true
  validates_associated :member
end
