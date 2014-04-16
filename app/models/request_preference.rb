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
end
