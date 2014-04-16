class AddDeletedAtToLightningtalks < ActiveRecord::Migration
  def change
    add_column :lightningtalks, :deleted_at, :datetime
  end
end
