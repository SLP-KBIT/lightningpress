class ChangeMemberIdTypeToIntegerInLightningtalk < ActiveRecord::Migration
  def self.up
    change_column :lightningtalks, :member_id, :'integer USING CAST(member_id AS integer)'
  end

  def self.down
    change_column :lightningtalks, :member_id, :string
  end
end
