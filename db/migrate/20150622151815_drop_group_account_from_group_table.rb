class DropGroupAccountFromGroupTable < ActiveRecord::Migration
  def self.up
    remove_column :groups, :group_account
  end

  def self.down
    add_column :groups, :group_account, :string, null: false
  end
end
