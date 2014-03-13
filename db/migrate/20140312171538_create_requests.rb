class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.int :member_id
      t.text :title
      t.text :content
      t.int :presenter_id
      t.datetime :created_at
      t.int :satus

      t.timestamps
    end
  end
end
