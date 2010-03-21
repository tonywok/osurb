class AddAdminFlagToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :name, :string
  end

  def self.down
    remove_column :users, :admin
    remove_column :users, :name
  end
end
