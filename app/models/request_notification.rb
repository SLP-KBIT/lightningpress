# == Schema Information
#
# Table name: request_notifications
#
#  id              :integer          not null, primary key
#  receiver_id     :integer
#  request_id      :integer
#  response_status :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class RequestNotification < ActiveRecord::Base
  belongs_to :receiver, foreign_key: :receiver_id, class_name: Member
  belongs_to :request

  validates :receiver_id, :request_id, presence: true
  #validates :response_status, inclusion: {in: []}
  validates_associated :receiver, :request

end
