class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.text :name
      t.text :student_number
      t.text :account
      t.text :password
      t.boolean :is_admin
      t.boolean :is_denied

      t.timestamps
    end
  end
end
