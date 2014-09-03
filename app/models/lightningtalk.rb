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
#  summary          :text
#  deleted_at       :datetime
#

class Lightningtalk < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :member, foreign_key: :member_id, class_name: Member
  has_many :lt_comments, dependent: :delete_all
  has_many :lt_preferences, dependent: :delete_all

  validates :name, :member_id, :summary, presence: true
  validates_associated :member

  def file_save(file)
    self.content_path = 'public/pdf/' + file.original_filename
    File.open(self.content_path, "wb") do |f|
      f.write file.read
    end
  end

end
