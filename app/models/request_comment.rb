class RequestComment < ActiveRecord::Base
  belongs_to :member
  belongs_to :request
end
