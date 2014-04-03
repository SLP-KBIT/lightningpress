class CreateRequestPreferences < ActiveRecord::Migration
  def change
    create_table :request_preferences do |t|
      t.integer :request_id
      t.integer :grade
      t.integer :member_id

      t.timestamps
    end
  end
end
