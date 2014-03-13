class CreateRequestComments < ActiveRecord::Migration
  def change
    create_table :request_comments do |t|
      t.int :member_id
      t.text :content
      t.datetime :created_at
      t.int :request_id

      t.timestamps
    end
  end
end
