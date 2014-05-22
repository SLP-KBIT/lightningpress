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
#  deleted_at     :datetime
#

class Request < ActiveRecord::Base
  acts_as_paranoid

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

#  validates :contributor_id, :title, :content, presence: true
#  validates :title, :content, presence: true
#  validates :status, inclusion: {in: [Status::None, Status::Waiting, Status::Assigned]}
#  validates_associated :contributor, :presenter

  def status_name
    return "募集中" if status == Status::None
    return "申請中" if status == Status::Waiting
    return presenter.name if status == Status::Assigned
  end

  def status_none?
    status == Status::None
  end

  def status_waiting?
    status == Status::Waiting
  end

  def status_assigned?
    status == Status::Assigned
  end
end
