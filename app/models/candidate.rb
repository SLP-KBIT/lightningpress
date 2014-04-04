# == Schema Information
#
# Table name: candidates
#
#  id         :integer          not null, primary key
#  request_id :integer
#  member_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Candidate < ActiveRecord::Base
  belongs_to :request, foreign_key: :request_id, class_name: Request
  belongs_to :member, foreign_key: :member_id, class_name: Member
end
