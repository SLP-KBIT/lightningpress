class LtComment < ActiveRecord::Base
  belongs_to :member, foreign_key: :member_id, class_name: Member
  belongs_to :lightningtalk, foreign_key: :lightningtalk_id, class_name: Lightningtalk
end
