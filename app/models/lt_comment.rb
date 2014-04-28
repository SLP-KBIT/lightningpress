# == Schema Information
#
# Table name: lt_comments
#
#  id               :integer          not null, primary key
#  member_id        :integer
#  content          :text
#  created_at       :datetime
#  lightningtalk_id :integer
#  updated_at       :datetime
#  deleted_at       :datetime
#

class LtComment < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :member, foreign_key: :member_id, class_name: Member
  belongs_to :lightningtalk, foreign_key: :lightningtalk_id, class_name: Lightningtalk
  validates :member_id, :lightningtalk_id, :content, presence: true
  validates_associated :member, :lightningtalk

end
