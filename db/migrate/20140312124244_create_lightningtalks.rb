class CreateLightningtalks < ActiveRecord::Migration
  def change
    create_table :lightningtalks do |t|
      t.text :name
      t.text :member_id
      t.datetime :performance_date
      t.text :content_path

      t.timestamps
    end
  end
end
