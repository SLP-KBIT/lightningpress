class RemoveFragFromToMembers < ActiveRecord::Migration
  def change
    remove_column :members, :flag, :boolean
  end
end
