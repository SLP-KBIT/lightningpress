# == Schema Information
#
# Table name: members
#
#  id              :integer          not null, primary key
#  name            :text
#  student_number  :text
#  account         :text
#  password_digest :text
#  is_admin        :boolean
#  created_at      :datetime
#  updated_at      :datetime
#  deleted_at      :datetime
#

class Member < ActiveRecord::Base
  acts_as_paranoid
  has_many :lightningtalks
  has_many :lt_comments
  has_many :request_comments
  has_many :requests
  has_many :candidates
  has_many :lt_preferences
  has_many :request_preferences
  has_many :request_notifications
  has_secure_password

  scope :id_is, -> (id) { where(id: id) }
end
