class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.int :request_id
      t.int :member_id

      t.timestamps
    end
  end
end
