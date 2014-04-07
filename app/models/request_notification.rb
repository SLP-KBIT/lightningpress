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
end
