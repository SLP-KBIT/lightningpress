class AddDeletedAtToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :deleted_at, :timestamp
  end
end
