class CreateLtComments < ActiveRecord::Migration
  def change
    create_table :lt_comments do |t|
      t.integer :member_id
      t.text :content
      t.datetime :created_at
      t.integer :lightningtalk_id

      t.timestamps
    end
  end
end
