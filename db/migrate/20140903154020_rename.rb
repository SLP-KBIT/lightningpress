class Rename < ActiveRecord::Migration
  def up
    rename_column :lightningtalks, :sumally, :summary
  end

  def down
    rename_column :lightningtalks, :summary, :sumally
  end
end
