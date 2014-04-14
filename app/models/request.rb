# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: requests
#
#  id             :integer          not null, primary key
#  contributor_id :integer
#  title          :text
#  content        :text
#  presenter_id   :integer
#  created_at     :datetime
#  status         :integer
#  updated_at     :datetime
#

class Request < ActiveRecord::Base
  belongs_to :contributor, foreign_key: :contributor_id, class_name: Member
  belongs_to :presenter, foreign_key: :presenter_id, class_name: Member
  has_many :request_comments
  has_many :candidates
  has_many :request_preferences
  has_one :request_notification

  module Status
    None     = 0
    Waiting  = 1
    Assigned = 2
  end

  def status_name
    return "募集" if status == Status::None
    return "申請中" if status == Status::Waiting
    return presenter.name if status == Status::Assigned
  end

end
