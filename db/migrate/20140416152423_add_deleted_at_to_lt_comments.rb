class AddDeletedAtToLtComments < ActiveRecord::Migration
  def change
    add_column :lt_comments, :deleted_at, :datetime
  end
end
