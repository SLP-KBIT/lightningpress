class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.text :name
      t.text :student_number
      t.text :account
      t.text :password_digest
      t.boolean :is_admin
      t.boolean :flag

      t.timestamps
    end
  end
end
