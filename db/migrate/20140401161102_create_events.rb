class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.text :name
      t.integer :member_id
      t.datetime :start_at
      t.datetime :end_at
      t.text :content_path
      
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
