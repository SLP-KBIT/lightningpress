class AddDeletedAtToRequestComments < ActiveRecord::Migration
  def change
    add_column :request_comments, :deleted_at, :datetime
  end
end
