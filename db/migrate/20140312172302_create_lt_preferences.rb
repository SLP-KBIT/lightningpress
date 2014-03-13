class CreateLtPreferences < ActiveRecord::Migration
  def change
    create_table :lt_preferences do |t|
      t.integer :lightningtalk_id
      t.integer :grade
      t.integer :member_id

      t.timestamps
    end
  end
end
