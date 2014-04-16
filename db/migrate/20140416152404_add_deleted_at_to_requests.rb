class AddDeletedAtToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :deleted_at, :datetime
  end
end
