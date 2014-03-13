class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.integer :request_id
      t.integer :member_id

      t.timestamps
    end
  end
end
