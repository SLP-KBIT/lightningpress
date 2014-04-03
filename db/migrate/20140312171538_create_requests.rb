class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :contributor_id
      t.text :title
      t.text :content
      t.integer :presenter_id
      t.datetime :created_at
      t.integer :satus

      t.timestamps
    end
  end
end
