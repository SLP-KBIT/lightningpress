class RequestComment < ActiveRecord::Base
  belongs_to :member, foreign_key: :member_id, class_name: Member
  belongs_to :request, foreign_key: :request_id, class_name: Request
end
