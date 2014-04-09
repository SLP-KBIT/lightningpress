class AddSumallyToLightningtalk < ActiveRecord::Migration
  def change
    add_column :lightningtalks, :sumally, :text
  end
end
