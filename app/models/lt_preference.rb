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
end
