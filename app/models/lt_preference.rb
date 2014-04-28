# == Schema Information
#
# Table name: lt_preferences
#
#  id               :integer          not null, primary key
#  lightningtalk_id :integer
#  grade            :integer
#  member_id        :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class LtPreference < ActiveRecord::Base
  belongs_to :lightningtalk
  belongs_to :member
  validates :lightningtalk_id, presence: true, uniqueness: {scope: [:member_id]}
  validates :grade, :member_id, presence: true
  validates :grade, presence: true, inclusion: {in: 1..5}
  validates_associated :lightningtalk, :member
end
