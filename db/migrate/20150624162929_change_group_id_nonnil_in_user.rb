class ChangeGroupIdNonnilInUser < ActiveRecord::Migration
  def self.up
    change_column :users, :group_id, :integer, :null => true
  end

  def self.down
    change_column :users, :group_id, :integer, :null => false
  end
end
