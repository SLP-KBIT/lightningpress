# == Schema Information
#
# Table name: request_preferences
#
#  id         :integer          not null, primary key
#  request_id :integer
#  grade      :integer
#  member_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class RequestPreference < ActiveRecord::Base
  belongs_to :request
  belongs_to :member

  validates :request_id, presence: true, uniqueness: {scope: [:member_id]}
  validates :member_id, presence: true
  validates :grade, inclusion: {in: 1..5}
  validates_associated :request, :member

end
