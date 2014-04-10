class CreateRequestNotifications < ActiveRecord::Migration
  def change
    create_table :request_notifications do |t|
      t.integer :member_id
      t.integer :request_id
      t.integer :response_status

      t.timestamps
    end
  end
end
