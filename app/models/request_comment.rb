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
  
  belongs_to :member
  belongs_to :request
end
