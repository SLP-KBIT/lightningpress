# == Schema Information
#
# Table name: request_comments
#
#  id         :integer          not null, primary key
#  member_id  :integer
#  content    :text
#  created_at :datetime
#  request_id :integer
#  updated_at :datetime
#  deleted_at :datetime
#

class RequestComment < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :member, foreign_key: :member_id, class_name: Member
  belongs_to :request, foreign_key: :reqest_id, class_name: Request

  validates :member_id, :content, :request_id, presence: true
  validates_associated :member, :request

end
