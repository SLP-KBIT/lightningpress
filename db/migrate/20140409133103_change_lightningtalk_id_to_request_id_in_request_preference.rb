class ChangeLightningtalkIdToRequestIdInRequestPreference < ActiveRecord::Migration
  def self.up
    rename_column :request_preferences, :lightningtalk_id, :request_id
  end

  def self.down
    rename_column :request_preferences, :request_id, :lightningtalk_id
  end
end
