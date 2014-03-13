class CreateLtComments < ActiveRecord::Migration
  def change
    create_table :lt_comments do |t|
      t.int :member_id
      t.text :content
      t.datetime :created_at
      t.int :lightningtalk_id

      t.timestamps
    end
  end
end
