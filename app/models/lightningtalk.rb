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
#

class Lightningtalk < ActiveRecord::Base
  belongs_to :member, foreign_key: :member_id, class_name: Member
  has_many :lt_comments
  has_many :lt_preference
end
