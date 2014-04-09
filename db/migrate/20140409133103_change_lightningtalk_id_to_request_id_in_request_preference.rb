class ChangeLightningtalkIdToRequestIdInRequestPreference < ActiveRecord::Migration
  def self.up
    rename_column :request_preferences, :lightningtalk_id, :request_id
  end
end
