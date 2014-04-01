class Candidate < ActiveRecord::Base
  belongs_to :request, foreign_key: :request_id, class_name: Request
  belongs_to :member, foreign_key: :member_id, class_name: Member
end
